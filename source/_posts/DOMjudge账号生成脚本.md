---
title: DOMjudge账号生成脚本
date: 2020-04-08 16:08:24
categories:
  - 编程语言
  - Python
mathjax: true
tags:
  - Domjudge
  - Python
abbrlink: a25c27c8
---
由于 `DOMjudge` 自带的添加队伍的不是很方便，所以还是自己写个python脚本生成 `csv` 导入数据库，配合 `phpmyadmin` 使用。
<!--more-->
> $Vesion1.0$  个人赛账号生成脚本

```py
def import_team(team_id, Users):
    team = open('import_team.csv', 'w', encoding='utf-8')
    for i in range(len(Users)):
        team.writelines('"%d","%d","%s","3","1","1","%s",NULL,NULL,NULL,"0"\n'
                        % (team_id + i, i + 1, Users[i], Users[i]))
    team.close()


def import_user(user_id, team_id, Users):
    user = open('import_user.csv', 'w', encoding='utf-8')
    for i in range(len(Users)):
        user.writelines('"%d","user%02d","%s",NULL,NULL,NULL,NULL,NULL,NULL,"1","%d"\n'
                        % (user_id + i, i + 1, Users[i], i + team_id))
    user.close()


def import_userrole(user_id, Users):
    userrole = open('import_userrole.csv', 'w', encoding='utf-8')
    for i in range(len(Users)):
        userrole.writelines('"%d","3"\n' % (user_id + i))
    userrole.close()


if __name__ == '__main__':
    User_id = 3 # 视情况而定，默认id为1,2的分别是admin,judgehost,所以这里从3开始
    Team_id = 1 # 视情况而定，默认初始为 1
    User = open('user.txt', 'r', encoding='utf-8')
    User = User.readlines()
    for j in range(len(User)):
        User[j] = User[j].strip('\n')
    import_team(Team_id, User)
    import_user(User_id, Team_id, User)
    import_userrole(User_id, User)
    print(User)
```