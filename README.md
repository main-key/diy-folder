# diy-folder

#### 介绍
windows系统创建DIY文件夹  
可以自定义文件夹别名、图标、备注  

#### 软件架构
BAT    批处理编写


#### 安装教程

1. 将{20230427：V1.4.0}文件夹下载到本地指定位置  
1. 将{20230427：V1.4.0}文件所在路径配置到环境变量path中[系统变量或用户变量]都可以
1. 配置好以后就可以在任意一个文件夹上方的地址栏中输入md或MD回车打开  
1. 然后根据提示操作即可 

注意：设置文件夹图标后图标位置不能更改  

#### 使用说明


1. 创建一个文件夹【md 文件名】  
1. 创建一个文件夹，并设置别名【md 文件名 别名】  如果创建的文件夹已存在，会修改别名  
1. 打开主界面操作【md】  可以根据提示操作  
1. 扫描当前目录下DIY过的文件夹【md ?】 可根据提示进行创建或修改  
1. 打开作者留言【md /?】 
1. 清除DIY文件夹的设置【mdel】 注：需要进入要清除DIY设置的文件夹  

 
注：‘md’大小写都可以。4，5用例是英文的问号  
	
总结：有窗口的根据窗口提示进行操作，没有窗口的根据命令来即可  
如果要设置有空格的文件夹名称或者别名 需要用英文双引号【"】括起来，，如【md "文 件 夹" "别 名"】。如果使用有窗口的方法则不需要输入双引号
  

#### 版本说明
20230427：V1.4.0
模块化更新，添加对已存在DIY的文件夹进行管理。  
添加删除功能，添加作者留言   
修复其他BUG

20230426：V1.3.0  
添加支持参数功能，支持参数功能默认不显示cmd窗口，但是不同电脑可能不一样，或许会一闪而过
优化主程序中0.2.0版本残留功能
  
20230425：V1.2.0  
通过DeskEdit程序完善V0.2.0中无法及时显示效果问题  
  
20221001：V0.2.0 为纯BAT编写  
主要有两个文件（一个创作，一个修改）文件夹  
不过这个版本更新文件夹后不能立刻显示出来
