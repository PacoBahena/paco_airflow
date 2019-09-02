import airflow
from airflow import models, settings
from airflow.contrib.auth.backends.password_auth import PasswordUser

user = PasswordUser(models.User())
user.username = 'test'
user.email = 'new_user_email@example.com'
user.password = 'test'
session = settings.Session()
session.add(user)
session.commit()
session.close()


