#!/bin/bash

cd /tmp
wget --no-check-certificate http://pypi.python.org/packages/source/s/setuptools/setuptools-0.6c11.tar.gz#md5=7df2a529a074f613b509fb44feefe74e
tar -zxf setuptools-0.6c11.tar.gz
cd setuptools-0.6c11
/opt/python/bin/python2.7 setup.py install
/opt/python/bin/easy_install pip

/opt/python/bin/pip install --upgrade distribute

/opt/python/bin/pip install biopython
/opt/python/bin/pip install networkx
/opt/python/bin/pip install numpy
/opt/python/bin/pip install scipy
LIBRARY_PATH="/usr/lib64/R/lib/" /opt/python/bin/pip install rpy2
/opt/python/bin/pip install pytz
/opt/python/bin/pip install matplotlib
/opt/python/bin/pip install MySQL-python
/opt/python/bin/pip install pymc
/opt/python/bin/pip install beautifulsoup4
/opt/python/bin/pip install lxml
/opt/python/bin/pip install virtualenv
/opt/python/bin/pip install virtualenvwrapper
/opt/python/bin/pip install virtualenv-clone
/opt/python/bin/pip install scikit-learn
/opt/python/bin/pip install tornado

cd /tmp
wget http://bitbucket.org/eigen/eigen/get/2.0.17.tar.gz
tar -xzf 2.0.17.tar.gz
cd eigen-eigen-*
cmake .
make install

cd ..
wget http://sourceforge.net/projects/openbabel/files/openbabel/2.3.1/openbabel-2.3.1.tar.gz/download
tar -zxf openbabel-2.3.1.tar.gz
mkdir build
cd build
cmake ../openbabel-2.3.1 -DPYTHON_BINDINGS=ON -DPYTHON_EXECUTABLE=/opt/python/bin/python2.7 -DPYTHON_INCLUDE_DIR=/opt/python/include/python2.7/ -DPYTHON_LIBRARY=/opt/python/lib/libpython2.7.a -DBUILD_GUI=OFF
make install

wget http://bkchem.zirael.org/download/oasa-0.13.1.tar.gz
tar -zxf oasa-0.13.1.tar.gz
cd oasa-0.13.1
/opt/python/bin/python setup.py install

cd /tmp
rm -rf pip-build* 2.0.17.tar.gz build eigen-eigen-b23437e61a07 openbabel-2.3.1* setuptools-0.6c11.tar.gz setuptools-0.6c11

cd /tmp
rm -rf mpi4py-1.3.1
wget https://bitbucket.org/mpi4py/mpi4py/downloads/mpi4py-1.3.1.tar.gz -O mpi4py-1.3.1.tar.gz
tar -zxf mpi4py-1.3.1.tar.gz
rm mpi4py-1.3.1.tar.gz
cd mpi4py-1.3.1/
rm mpi.cfg
/usr/bin/wget --no-check-certificate https://raw.github.com/argaen/utils/master/seeslab/cluster_scripts/mpi.cfg
/opt/python/bin/python2.7 setup.py build --mpi=mpich2
/opt/python/bin/python2.7 setup.py install
