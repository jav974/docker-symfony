php_version=8.2
webserver=nginx
project_dir=projects
symfony_version=6.3.*
tmp_dir=tmp_project
project_name=docker-symfony-php$(php_version)-$(webserver)

new:
	mkdir -p ${project_dir}/${project_name} && \
	cp -r ./.docker/* ${project_dir}/${project_name}/ && \
	cp -r ./.docker/.[!.]* ${project_dir}/${project_name}/ && \
	cd ${project_dir}/${project_name} && \
	docker compose build --build-arg PHP_VERSION=$(php_version) --build-arg WEBSERVER=$(webserver) && \
	docker compose up -d && \
	sleep 5 && \
	docker compose exec -u webuser web composer create-project symfony/skeleton:$(symfony_version) $(tmp_dir) --no-interaction && \
	docker compose exec -u webuser web mv -f $(tmp_dir)/* ./ && \
	docker compose exec -u webuser web mv -f $(tmp_dir)/.[!.]* ./ && \
	docker compose exec -u webuser web rm -rf $(tmp_dir) && \
	docker compose exec -u webuser web echo "/docker-compose.override.yaml" >> .gitignore

new-webapp:
	mkdir -p ${project_dir}/${project_name} && \
	cp -r ./.docker/* ${project_dir}/${project_name}/ && \
	cp -r ./.docker/.[!.]* ${project_dir}/${project_name}/ && \
	cd ${project_dir}/${project_name} && \
	docker compose build --build-arg PHP_VERSION=$(php_version) --build-arg WEBSERVER=$(webserver) && \
	docker compose up -d && \
	sleep 5 && \
	docker compose exec -u webuser web composer create-project symfony/skeleton:$(symfony_version) $(tmp_dir) --no-interaction && \
	docker compose exec -u webuser web mv -f $(tmp_dir)/* ./ && \
	docker compose exec -u webuser web mv -f $(tmp_dir)/.[!.]* ./ && \
	docker compose exec -u webuser web rm -rf $(tmp_dir) && \
	docker compose exec -u webuser web echo "/docker-compose.override.yaml" >> .gitignore && \
	docker compose exec -u webuser web composer require webapp --no-interaction
