##!/bin/sh

LOCAL_PATH=$(pwd)
LOCAL_DIR=${LOCAL_PATH%%*/}
EXPORT_PATH=$LOCAL_PATH/EXPORT
CURRENT_DATE=`date '+%Y%m%d%H%M%S'`
CRASH_PATH=$CURRENT_DATE.crash

cd $LOCAL_DIR

echo "\n"
echo "********************************************"
echo "1、首先要安装了Xcode"
echo "2、如果是ips文件，直接改后缀名为.crash"
echo "3、将.crash文件放置在脚本同级目录下"
echo "4、将.DSYM文件放置在脚本同级目录下"
echo "5、脚本会按照当前时间格式化.crash文件名"
echo "6、输出结果将放在同目录下EXPORT文件夹中"
echo "********************************************"
echo "\n"

export DEVELOPER_DIR=`xcode-select -print-path`

SYMBOLICATE_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/iOSSupport/Library/PrivateFrameworks/DVTFoundation.framework/Versions/A/Resources/symbolicatecrash

cp $SYMBOLICATE_PATH $LOCAL_PATH

read -p "拖拽crash文件到这->" CRASH_TMP_PATH
read -p "拖拽DSYM文件到这->" DSYM_PATH

mv "$CRASH_TMP_PATH" "$CRASH_PATH"

FILE_NAME=$(basename $CRASH_PATH .crash)
EXPORT_FILEPATH=$EXPORT_PATH/$FILE_NAME.txt

if [ ! -d "$EXPORT_PATH" ]; then
    mkdir $EXPORT_PATH
fi

./symbolicatecrash $CRASH_PATH $DSYM_PATH > $EXPORT_FILEPATH

echo "\n"
echo "********************************************"
echo  ".crash文件路径->$CRASH_PATH"
echo  ".crash文件路径->$CRASH_TMP_PATH"
echo  ".DSYM文件路径->$DSYM_PATH"
echo  ".symbolicatecrash文件路径->$LOCAL_PATH/symbolicatecrash"
echo  ".symbolicatecrash源文件路径->$SYMBOLICATE_PATH"
echo  "export文件路径->$EXPORT_FILEPATH"
echo "********************************************"
echo "\n"
