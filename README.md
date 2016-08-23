# deploy_prediction-io
Deploy un servidor de [Prediction.io](http://predictionio.incubator.apache.org/) en un solo comando XD

Es importante destacar que este script esta pensado para ser ejecutado sobre distro de linux hijas de **Debian**...

### Prerequisitos:

+ Git tools
+ Python 2.7

##### Dependencias:

	sudo apt-get install build-essential checkinstall
	sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev
	
##### Herramientas requeridas:

##### Python 2.7
	cd ~/Downloads/
	wget http://python.org/ftp/python/2.7.5/Python-2.7.5.tgz
	tar -xvf Python-2.7.5.tgz
	cd Python-2.7.5
	./configure
	make
	sudo checkinstall

##### GITHUB:
	
	sudo apt-get install git-all

### Para deployar corra en su server:

	sudo su -c "cd /tmp && rm -rf ./deploy_prediction-io && git clone https://github.com/JoseSalgado1024/deploy_prediction-io.git && ./deploy_prediction-io/scripts/deploy_prediction.sh" 

