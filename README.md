# DSYMScript
简单好用的解析.crash、.ips崩溃日志脚本，希望能帮助到部分iOS开发者

1、首先要安装了Xcode
2、如果是ips文件，直接改后缀名为.crash
3、将.crash文件放置在脚本同级目录下
4、将.DSYM文件放置在脚本同级目录下
5、运行脚本前确保文件目录下有三个文件
    a.  .crash文件
    b.  对应包的DSYM文件
    c.  symtool.sh文件
5、脚本会按照当前时间格式化.crash文件名
6、输出结果将放在同目录下EXPORT文件夹中


附件：使用步骤（包含详细步骤）
