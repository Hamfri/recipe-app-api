docker-compose run app sh -c "django-admin.py startproject app ."
docker-compose run app sh -c "django-admin.py startapp core"
docker-compose exec app sh -c "python manage.py startapp core"
docker-compose run app sh -c "python manage.py test"
docker-compose exec app sh -c "python manage.py makemigrations core"

NB:: Use exec run is bad idea as it clutters system with exited containers
