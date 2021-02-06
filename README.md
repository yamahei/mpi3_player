# mpi3 player
Just play mp3


概要
----
ひたすらMP3ファイルをシャッフル再生するサービス。
以下のセットアップは、Raspberry pi想定で書いてます。

セットアップ
------------
### mpg321のインストール

```
$ sudo apt-get install mpg321
```

### アプリの配置とサービス化

```
# 取得
$ git clone https://github.com/yamahei/mpi3_player.git mpi3

# 配置
$ sudo mv mpi3 /opt/
$ sudo chmod +x /opt/mpi3/bin/*

# サービス化
$ sudo cp /opt/mpi3/service/mpi3.service /lib/systemd/system/
$ sudo chown root. /lib/systemd/system/mpi3.service
$ sudo systemctl daemon-reload
$ sudo systemctl enable mpi3 
```

### 起動

```
$ sudo systemctl start mpi3
```

### ログ

```
$ sudo journalctl -f -u mpi3
```

### スキップコマンドの有効化

TODO
