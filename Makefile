##########
# Docker
##########


build:
	docker image build -t jupyter_spark_custom .

run:
	docker run --rm -p 8888:8888 -v $(PWD)/notebooks:/home/jovyan/work --name jupyter_kaggle_house_prices jupyter_spark_custom

run-jupyterlab:
	docker run --rm -p 8888:8888 -v $(PWD)/notebooks:/home/jovyan/work --name jupyter_kaggle_house_prices jupyter_spark_custom start.sh jupyter lab
