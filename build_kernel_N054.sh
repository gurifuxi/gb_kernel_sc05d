TOP_DIR=$PWD

# generate LOCALVERSION
. mod_version

# check and get compiler
. cross_compile

# set build env
export ARCH=arm
export CROSS_COMPILE=$BUILD_CROSS_COMPILE
export LOCALVERSION="-$BUILD_LOCALVERSION"
cd ..
CURRENT_DIR=$PWD
cd -

KERNEL_DIR=.
export KERNEL_DIR
echo "PATH print"
echo $PATH

mkdir -p ./obj/KERNEL_OBJ/

make O=./obj/KERNEL_OBJ/ msm8660_q1_jpn_ntt_defconfig
make O=./obj/KERNEL_OBJ/ headers_install
make -j15 O=./obj/KERNEL_OBJ/ 

cp -f ./obj/KERNEL_OBJ/arch/arm/boot/zImage .
