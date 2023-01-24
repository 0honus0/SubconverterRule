{% if request.target == "clash" or request.target == "clashr" %}

mixed-port: {{ default(global.clash.mixed-port, "7890") }}
tproxy-port: {{ default(global.clash.tproxy-port, "7893" )}}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
ipv6: true
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
{% if default(request.clash.dns, "") == "1" or default(global.clash.dns, "") == "1" %}
dns:
  enable: true
  listen: 0.0.0.0:53
  enhanced-mode: redir-host #fake-ip
  nameserver:
      - https://dns.alidns.com/dns-query
      - https://doh.pub/dns-query
      - https://rubyfish.cn/dns-query
      - https://doh.opendns.com/dns-query
      - https://dns64.cloudflare-dns.com/dns-query
      - 223.5.5.5
      - 223.6.6.6
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8, 239.255.255.250/32
network_check_url=http://www.bing.com
server_check_url=http://www.gstatic.com/generate_204
server_check_timeout = 2000
resource_parser_url=https://cdn.jsdelivr.net/gh/KOP-XIAO/QuantumultX@master/Scripts/resource-parser.js
profile_img_url=https://yattazen.com/favicon.ico
dns_exclusion_list = *.cmpassport.com, *.jegotrip.com.cn, *.icitymobile.mobi, id6.me, *.pingan.com.cn, *.cmbchina.com, *.localnetwork.uop, mfs.ykimg.com*.ttf, *.icbc.com.cn
geo_location_checker=http://api.live.bilibili.com/ip_service/v1/ip_service/get_ip_addr? , https://cdn.jsdelivr.net/gh/KOP-XIAO/QuantumultX@master/Scripts/IP_bili_cn.js

[dns]
no-ipv6
no-system
server = 223.5.5.5
server = 223.6.6.6
server = 119.29.29.29
server = /*itunes.apple.com/system
server = /*testflight.apple.com/8.8.4.4
server = /*icloud.com/119.29.29.29
server = /*icloud.com.cn/119.29.29.29
server = /*.tencent.com/119.29.29.29
server = /*.weixin.com/119.29.29.29

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Global.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Final.png

[server_remote]

[filter_remote]

[rewrite_remote]
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rewrite/QuantumultX/AllInOne/AllInOne.conf, tag=blackmatrix7去广告规则, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/Weibo.conf, tag=微博去广告, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/StartUp.conf, tag=去开屏广告, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/0honus0/SubconverterRule/master/QuantumultX/Conf/own.conf, tag=自定义规则, update-interval=86400, opt-parser=false, enabled=true
[server_local]

[filter_local]
HOST-SUFFIX,95599.cn,direct
HOST-SUFFIX,abchina.com,direct
HOST-SUFFIX,bscabank.com,direct
HOST-SUFFIX,openaboc.cn,direct
HOST-SUFFIX,openaboc.com,direct
HOST-SUFFIX,openaboc.com.cn,direct
host-suffix, local, direct
host-keyword, yattazen, proxy
host, jdsharedresourcescdn.azureedge.net, proxy
ip-cidr, 10.0.0.0/8, direct
ip-cidr, 17.0.0.0/8, direct
ip-cidr, 100.64.0.0/10, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 192.168.0.0/16, direct
ip-asn, 132203, direct

[rewrite_local]

[task_local]

[mitm]
{% if request.key == "honus" %}
passphrase = 35BD5CC4
p12 = MIILwwIBAzCCC40GCSqGSIb3DQEHAaCCC34Eggt6MIILdjCCBc8GCSqGSIb3DQEHBqCCBcAwggW8AgEAMIIFtQYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQIk0rn7JlMAMECAggAgIIFiPeo2Y8lcpb5G9aG/94U6tMTvnB55VWBLB8DPI93wsLCwVHDbcpIj0cTJdpLnBMzilS+qGtFxatQFQdtaCtj6W/9M5NAVbMppWAhCV3WniNAm/jYB4PxjN5/uqj42ydDKFJDb4LS5JCIp3jB+NTqB3YXl5yub91Mz9CtwPC5otFEs5PK4K3GtHU9uSHuVS3TPamEgf1lr4mckgmOicAkG3OxKI0kSJGLV4oMk0fhnO7o8WUm6/EmYFxPXckem4z9DbbKjZlPGVdB8C2Xn2pNTtituqdhZ15xFfynlBZFPIA5N85Ye+JQaF87q6lJTq9KxJ2LXQDvx8ayk1Uenmtbx9MHFe02UebWj3UCIyc8JsLc614rgk1GgVDvMawT5xg4yysdkpX50jvXGQFHIrcG+WjQeEIFKi09z0W8CZLzebJWKElsVkppPOI1aLAN2Xmx4nGyQINsU3GRd0jQ7V9diCT9T0FdKyys65f0cWfT+KGpMZA3e6hvH6GBFjmfC1R253AhF96IiVeXcaZq6A+Pa71DM5WF1tAI+0Z7rF1JWh7cdeYhGCzpEHt2YdVr197+1LY43v3b1KU0enhM+aCyGZqYyThNpbYSzesmP/i0g2YQenFh3615MbBaVALUADqgHrmmjco6tir6tV2r8XDKZxjYpoeUen52p1KczhgQb6QuyNKh0ixsIISmBRDhm37SrlVlmt/1aZaRMNdhyOkkf05ZhoWhp2WQvOrv1dCFeRpiae2tILGYwzaoM7WlDJenfQp7QF7cI8yfQRkhvo02LTW42inTOCqeLIz2Z9g5ONt5FBKvfpZuUQodOITMC+I0yqFDYDV4MxO61BN/zzJ0uB5i0Ob2JhsMQ8InvlOf+xWDsSZc/OKlk/D10HStQBzTTtf/XKULG/eXy2yXAyD3J+SAl18SyAd5Rh5fBy3MxJgkM5qLZ/VOQ9tkaBhzqjo6yrMx6rORqIeJVPEnYf6h43bhMCO29kots+lOk5mM4SnYEtSot3OdDnCNtYeLA9PaIv0eNLrHRvmSjngog2KJwtIgPtUZv7LryimADEwhgRj/I0xCh/JOMSAjyTWCmWcHLrc+HbmGdayVuMqaSI4lhQitsRM9DbTIBiYEj1+qZ59n5xm8xTIvcIXpY41zMywdq8WGCgKvB377FmDq+DXVe4RqU2zSeGX2XYILobA9vv2FCkVyniYdDv+56miCmVD3r29GSQIog2+hbfOeirVa0jW88a6loNZBRDKUqYXQdbzM7T71k23StZ+of61gqnP08QU+doEmE3PrPuPhxm841IaL5FsPEWgiFeB/LnM0xNnAPDTcDniXaSRFcjEU08OYI2NE0dm7WzchoIlBAsdhGDzd2Fz8fk2ZJ/9XDnXM1TFI2jT+2mxlD5WB7XrVRUO+Ejs4kRbqwSFtBILzxEWDI2pUGHt6sSGjh3ZlAaEkcCxW5+Pmk3M2RQa6bAUawlOtXbSg0L2QzLJFsNqGlvzNEUaZAU7bTs22IWD3uSo2acCqT10mq/2vGa/4Ir3qVMTl6RmOF80f6bzjzqXAjeB0sitQI7ipgHIEafbJzyAAstjqRSRdgEp7oLmnLgNv+WOOdkb8n76JptNkNCsFEqfaPXSN1xc5+TICiaJw1KTxM8aKPnYQPbIwAV3SewVb5NivcWejZrFhf90Vfv8w7Uh6Wel4EdfUzZxU2eGkCNNjDMpCAJpQJP4LCLJgJbC0AqQIFsXqRChtd/hqwBkU8aFC4eUgd3t3jy2RLs0akXKkqSKhAnA1XIZ97b99RkzPxeGC51u8z78JJZpL5czc170A1qM6X/Gf69aZpew/SfV6l/x+EKaqKr/fzK/S9LHmV5UosC7g1n8RspoF6P7DHv7nX1GK5MomTopgxDCCBZ8GCSqGSIb3DQEHAaCCBZAEggWMMIIFiDCCBYQGCyqGSIb3DQEMCgECoIIE7jCCBOowHAYKKoZIhvcNAQwBAzAOBAgVY6+DJH1FVgICCAAEggTI0N4vhckkdpdwDz/XE/RZS7dkIdTaZey9wbhoenYnJoyFQ13RNr2BdHafuHUdR5hKy7aIR7sI9ixfD2C7jduVuvBuABhrtDax3/UloNVpS0+zKWWSvaX3uzxmCo02YoKl520lmN9WL9MkT0uk4c2Uy1ZUgYyfJbTuhpcsW+Ys6Jy6hI9/5T6/KSwcTy3cfDZS0lxCtbjmxbslO7zDE7NAmlxXUXCuvk2+eUD2mWGaegw/JIfq4AHs6VNxmjyVWofjV0HPsz1wE2krCXjtvVDpIg+UI+sRTeMKaW+/jl2HcgtGWbLkTHhiQXYOc6RK6Z/jCJa1pJcckEqhMCoc4q65gdgWZ2Y/cMDlOEuKPGAId684SoteCJckKuFZ9fzQHhkaeOnftnGt6I98hWwpN5Akf1wg9DN7+0ZphmRyWAW3ENxJtyL97R/NauRD3ifLfiIExm9Uk8Spvu9LYmUC/iZd0DkIhDvrJTL4LAGPc8enabGLpazNOjZ9g4gf9qTqp0lS9NFCMTYFY3N/hJ38TslIavX+1g+epJF5D1I/JpdYVs4lKXMKATFewW7aKv4jhgnNFrxGzhqugKLaLrWJKzcYoah7A4B6l4PfCln2YL/9xyRakqULMu0YBl/3haXaxlRB0iGynZzeptBJ6ZznrMEFTsKYS2fj5DtnO9VwNHEA37u8kknNvzO6beJxlB4WU+4oY+sIL+jg5YJcOSN5Pwh4f3fU/LD6pByLUVaJPePTvL09EZhsG56jdfxkzFxNPFhkF+rdiNfxGtTl6AvT2H/KNci4XP937Xv1qgzOixIFVnIL7Bxc1azGPJtOhHFYt7Jz+tz06/Go06sYrlKVagtExneH/gXilr2VL6hwx17GelPd7Obd5U4un1AnAcoMye51IbiLeCK3IJtJl8iWKB/eaURk684Z5oRBZ+7CFQK6MGnmd8E0sd43wOu+WBe2Mtmrv82Vs/bF0cg3PxNExtX3xcf3MljX8yrUu1dAdAcJOBRUB19YKjKF3Lw+w9HrJ1o4ulqktMNPKrdYfOmOQWiOITWl51KeGsLOGvqHLC2eeg6P8lCSPhAM66X5vk51d7LVYbo/F+2wROkEp3T+KD3nVUH+zBKGmA3Y3j6iPCV1BbGdHZkXOCRC5HA3fKCH0FDo1eLejyZh6FRY9K9HN7PVng8yCr7Fs75Z3vg3HDOCePpVKiQVyxY5HhHPR0RUjrUILcn2Q/XnOOVXrIrMLYJ7QqTIDbRozpf+8+LeL3CD39PT1sk+rC4DIjBMda55eEupSKxxaPGlW/ZdI1S/G+2B+V5U/Fv7SteyZBvBweal2ebviqICNZ/FKABDOdwFeTJXd23bNMfj1T8GuUTicGMJz/hoau3QXbzCwZZNa4uG1q0CFcAtOmmO+Xx+v4569pWyCvgrBpq+nxtuAhnKsoKHegqNJh3jGUNKwFpxLy001KuL0AJiCiHuLS+oneX2a+tFqpD9WujYTtZHUGBr44LqQACE1XUtC+C1aVi++EnsJwH6d6gU6vTeCoPo1arsNCd+u9qut2LbSoU9XWFXIw2MB75a6K8BtvcHZrFk5XVXeRDkQmpQIlR/qL1kgcIUQoWcLAtJrxF3jLSu5UJp0kRdhOlG6Duomz5hMYGCMCMGCSqGSIb3DQEJFTEWBBQsC+IzUeVAinvuaO24Wk52t6oO6DBbBgkqhkiG9w0BCRQxTh5MAFEAdQBhAG4AdAB1AG0AdQBsAHQAIABYACAAQwBBACAARQBFADYANgA0ADMAOAAxACAAKAAxADcAIABTAGUAcAAgADIAMAAyADIAKTAtMCEwCQYFKw4DAhoFAAQUQO5YTjs3ikfgIjYWtVktoQ+xQO8ECIeUkiFv2qXK
{% endif %}

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
