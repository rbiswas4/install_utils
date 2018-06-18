# To use a new miniconda distribution, use this script to install miniconda. By default, packages will be installed to ${HOME}/miniconda3 but the install location can be changed to a user specified location. 

# The syntax for running this script is

# bash install_python.sh [install_location]

# (the square brackets indicate optional arguments). The `install_location` should be an absolute path
#and the directory must exist.

# For example:
# bash install_python.sh ${HOME}/tmp/miniconda3

# will install miniconda3 to ${HOME}/tmp/miniconda3 and return an error if ${HOME}/tmp/miniconda3 does not exist

## Directory to install miniconda to
miniconda_dir=${HOME}/miniconda3
if [ $# -gt 1 ];
    then echo "illegal number of parameters"
fi
if [ $# -eq 1 ]; then
    miniconda_dir=$@
    echo ${miniconda_dir}
    if [ -d ${miniconda_dir} ]; then
        echo "install directory ${miniconda_dir} already exists, please delete first to clobberr"
        exit
    fi
    dir=$(dirname ${miniconda_dir})
    if [ ! -d "${dir}" ]; then
        echo "path to miniconda install does not exist"
        exit
    fi
fi
echo " installing python to $miniconda_dir"

## Download miniconda 
# miniconda version
MINICONDA_VERSION="latest"
# platform linux/osx
system=`uname -s`
echo ${system}
if [ "$system" = "Linux" ]; then
   platform="Linux"
elif [ "$system" = "Darwin" ]; then
   platform="MacOSX" 
else
    echo "Platform unknown\n"
fi
echo "platform = ${platform}\n"
fname="Miniconda3-${MINICONDA_VERSION}-${platform}-x86_64.sh"
url="https://repo.continuum.io/miniconda/${fname}"
curl -OL ${url}

## Install miniconda
bash ${fname} -b -p ${miniconda_dir}
printf "You can clean up by typing \n rm -f $fname\n"
echo "In order to use this python, please set your path to include ${miniconda_dir}/bin, for example in bash:"
echo "export PATH=${miniconda_dir}"'/bin:$PATH'
echo "export PATH=${miniconda_dir}"'/bin:$PATH'>./setup.sh
echo "Or ```source the ./setup.sh``` file everytime you want to use this python"
export PATH=${miniconda_dir}/bin:$PATH

