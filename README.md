# Blog Django

This is a Blog post project created with Python and Django. Blog administrators can access the administrative area in `/admin` and do all the management of categories, posts and registered users. The web site has a simple UI and merely illustrative posts for example.

### Access the blog through this [Heroku link](http://brunohubner-blog-django.herokuapp.com).

#

### Follow the steps to run the project locally.

<br />

- Create Python Virtual Environment
```
python -m venv venv
```

- Activate virtualenv
```
source ./venv/bin/activate
```

- Apply Migrations
```
python manage.py migrate
```

- Create a Superuser
```
python manage.py createsuperuser
```

- Run project in development mode
```
python manage.py runserver
```