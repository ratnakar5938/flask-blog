from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from werkzeug.utils import secure_filename
import math
import json
import os
from datetime import datetime

local_server = True
with open('config.json', 'r') as c:
    params = json.load(c)['params']

app = Flask(__name__)
app.secret_key = "secret-key"
app.config['UPLOAD_FOLDER'] = params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail_user'],
    MAIL_PASSWORD=params['gmail_password']
)
mail = Mail(app)
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)


class Contact(db.Model):
    '''
    sno, name, email, phone, feedback, date
    '''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(20), nullable=False)
    phone = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(200), nullable=False)
    date = db.Column(db.String(12), nullable=True)


class Posts(db.Model):
    '''
    sno, title, slug, content, date
    '''
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(25), nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    tagline = db.Column(db.String(25), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    img_url = db.Column(db.String(25), nullable=False)
    date = db.Column(db.String(12), nullable=True)


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    # [0:params['no_of_blog']]
    last = math.ceil(len(posts) / int(params['no_of_blog']))
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1

    page = int(page)
    posts = posts[(page-1) * int(params['no_of_blog']):((page-1) * int(params['no_of_blog']) + int(params['no_of_blog']))]
    if page == 1:
        previous = "#"
        next = "/?page=" + str(page + 1)
    elif page == last:
        previous = "/?page=" + str(page - 1)
        next = '#'
    else:
        previous = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params, posts=posts, prev=previous, next=next)


@app.route('/about')
def about():
    return render_template('about.html', params=params)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        '''add entry to the database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contact(name=name, email=email, phone=phone, msg=message, date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients=[params['gmail_user']],
                          body=message + "\n" + phone
                          )

    return render_template('contact.html', params=params)


@app.route('/post/<string:posts_slug>', methods=['GET'])
def post_route(posts_slug):
    post = Posts.query.filter_by(slug=posts_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route('/signin', methods=['GET', 'POST'])
def sign_in():
    if 'user' in session and session['user'] == params['admin_user']:
        posts = Posts.query.filter_by().all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        user_name = request.form.get('user_name')
        user_password = request.form.get('password')
        if user_name == params['admin_user'] and user_password == params['admin_password']:
            # set the session variable
            session['user'] = params['admin_user']
            posts = Posts.query.filter_by().all()
            return render_template('dashboard.html', params=params, posts=posts)
        else:
            return render_template('signin.html', params=params)
    return render_template('signin.html', params=params)


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded successfully"


@app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            box_title = request.form.get('title')
            slug = request.form.get('slug')
            tag_line = request.form.get('tag_line')
            content = request.form.get('content')
            img_url = request.form.get('img_url')

            if sno == '0':
                post = Posts(title=box_title, slug=slug, tagline=tag_line, content=content, img_url=img_url,
                             date=datetime.now())
                db.session.add(post)
                db.session.commit()
                return redirect('/signin')
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.tagline = tag_line
                post.content = content
                post.img_url = img_url
                db.session.commit()
                return redirect('/edit/' + sno)

        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post)


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/signin')


@app.route('/delete/<string:sno>')
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/signin')


app.run(debug=True)
