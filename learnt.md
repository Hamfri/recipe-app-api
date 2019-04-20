docker-compose run app sh -c "django-admin.py startproject app ."
docker-compose run app sh -c "django-admin.py startapp core"
docker-compose exec app sh -c "python manage.py startapp core"
docker-compose exec app sh -c "python manage.py makemigrations core"
docker-compose run --rm app sh -c "python manage.py makemigrations"
docker-compose run --rm app sh -c "python manage.py startapp user"
docker-compose run --rm app sh -c "python manage.py test && flake8"
NB:: Use exec or run --rm run alone is bad idea as it clutters system with exited containers
