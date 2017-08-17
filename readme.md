### 升级方案

#### ver.json 格式

```json
{
  "ver":12,
  "filedata":[
    "U,%APPDIR%/libcg.dll,libcg.dll,12122333sss22222",
    "D,%APPDIR%/libcg.dll,libcg.dll,12122333sss22222",  
    "D,%APPDIR%/libcg.dll,libcg.dll,12122333sss22222"
 
  ]

}

```
1. 格式:  动作,本地文件,远程文件是以filedata为根目录的相对路径,md5码.
2. 动作:
- U=更新功能
- D=删除功能
3. 文档必是utf8编码
4. 文件名区分大小写.

 

#### 宏变量
1. %APPDIR% 表示安装目录.

