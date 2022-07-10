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