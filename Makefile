# Makefile to download, build, start and stop the
# kaggle house prices notebook
#

download:
	echo "Downloading data from kaggle..."
	kaggle competitions download -c house-prices-advanced-regression-techniques -p $(PWD)/notebooks/data/

build:
	docker image build -t jupyter_spark_custom .

run:
	docker run --rm \
		-p 8888:8888 \
		-v $(PWD)/notebooks:/home/jovyan/work \
		--name jupyter_kaggle_house_prices \
		jupyter_spark_custom

run-jupyterlab:
	docker run --rm \
		-e JUPYTER_ENABLE_LAB=yes \
		-p 8888:8888 \
		-v $(PWD)/notebooks:/home/jovyan/work \
		--name jupyter_kaggle_house_prices \
		jupyter_spark_custom

stop:
	docker container stop jupyter_spark_custom
