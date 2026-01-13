{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: {{ default(global.clash.external_controller, "127.0.0.1:9090") }}
{% if default(request.clash.dns, "") == "1" %}
dns:
  enable: true
  listen: :1053
  nameserver:
      - https://223.5.5.5/dns-query
      - 114.114.114.114
      - https://doh.pub/dns-query
      - 119.29.29.29
      - https://doh.apad.pro/dns-query
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
# IPV6 启动与否
ipv6 = false
# udp 类的 dns 服务器，用,隔开多个服务器，system 表示系统 dns
dns-server = 119.29.29.29, 223.5.5.5
# DNS over HTTPS服务器，用,隔开多个服务器
doh-server = https://223.5.5.5/resolve, https://sm2.doh.pub/dns-query
# 是否开启局域网代理访问
allow-wifi-access = false
# 开启局域网访问后的 http 代理端口
wifi-access-http-port = 7222
# 开启局域网访问后的 socks5 代理端口
wifi-access-socks5-port = 7221
# 测速所用的测试链接，如果策略组没有自定义测试链接就会使用这里配置的
proxy-test-url = http://connectivitycheck.gstatic.com
# 节点测速时的超时秒数
test-timeout = 2
# 指定流量使用哪个网络接口进行转发
interface-mode = auto
sni-sniffing = true
# 禁用 stun 是否禁用 stun 协议的 udp 数据，禁用后可以有效解决 webrtc 的 ip 泄露
disable-stun = true
# 策略改变时候打断连接
disconnect-on-policy-change = true
# 一个节点连接失败几次后会进行节点切换，默认 3 次
switch-node-after-failure-times = 3
# 订阅资源解析器链接
resource-parser = https://gitlab.com/lodepuly/vpn_tool/-/raw/main/Resource/Script/Sub-Store/sub-store-parser_for_loon.js
# 自定义 geoip 数据库的 url
geoip-url = https://gitlab.com/Masaiki/GeoIP2-CN/-/raw/release/Country.mmdb
# 配置了该参数，那么所配置的这些IP段、域名将不会转发到Loon，而是由系统处理
skip-proxy = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, localhost, *.local, captive.apple.com, e.crashlynatics.com
# 配置了该参数，那么所配置的这些IP段、域名就会不交给Loon来处理，系统直接处理
bypass-tun = 10.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 192.0.0.0/24, 192.0.2.0/24, 192.88.99.0/24, 192.168.0.0/16, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 239.255.255.250/32, 255.255.255.255/32
# 当切换到某一特定的WiFi下时改变Loon的流量模式，如"loon-wifi5g":DIRECT，表示在loon-wifi5g这个wifi网络下使用直连模式，"cellular":PROXY，表示在蜂窝网络下使用代理模式，"default":RULE，默认使用分流模式
ssid-trigger = "Ccccccc":DIRECT,"cellular":RULE,"default":RULE

[Proxy]

[Remote Proxy]

[Remote Filter]

[Proxy Group]
♻️ 自动选择=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
🔰 节点选择=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
🌍 国外媒体=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
🌏 国内媒体=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
Ⓜ️ 微软服务=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
📲 电报信息=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
🍎 苹果服务=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
🎯 全球直连=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
🛑 全球拦截=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
🐟 漏网之鱼=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[Rule]

[Remote Rule]

[Rewrite]

[Host]

[Script]
# 多看阅读  (By @chavyleung)
# 我的 > 签到任务 等到提示获取 Cookie 成功即可
http-request ^https:\/\/www\.duokan\.com\/checkin\/v0\/status script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/duokan/duokan.cookie.js, requires-body=true, tag=多看_cookie
cron "16 9 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/duokan/duokan.js, tag=多看阅读

# 飞客茶馆  (By @chavyleung)
# 打开 APP, 访问下个人中心
http-request ^https:\/\/www\.flyertea\.com\/source\/plugin\/mobile\/mobile\.php\?module=getdata&.* script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/flyertea/flyertea.cookie.js, tag=飞客茶馆_cookie
cron "17 9 * * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/flyertea/flyertea.js,tag=飞客茶馆

# 10010  (By @chavyleung)
# 打开 APP , 进入签到页面, 系统提示: 获取刷新链接: 成功
# 然后手动签到 1 次, 系统提示: 获取Cookie: 成功 (每日签到)
# 首页>天天抽奖, 系统提示 2 次: 获取Cookie: 成功 (登录抽奖) 和 获取Cookie: 成功 (抽奖次数)
http-request ^https?:\/\/act.10010.com\/SigninApp\/signin\/querySigninActivity.htm script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.cookie.js, tag=中国联通_cookie1
http-request ^https?:\/\/act.10010.com\/SigninApp(.*?)\/signin\/daySign script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.cookie.js, tag=中国联通_cookie2
http-request ^https?:\/\/m.client.10010.com\/dailylottery\/static\/(textdl\/userLogin|active\/findActivityInfo) script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.cookie.js, tag=中国联通_cookie3
cron "18 9 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.js, tag=中国联通

# 万达电影  (By @chavyleung)
# 进入签到页面获取，网页端:https://act-m.wandacinemas.com/2005/17621a8caacc4d190dadd/
http-request ^https:\/\/user-api-prd-mx\.wandafilm\.com script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/wanda/wanda.cookie.js, tag=万达电影_cookie
cron "19 9 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/wanda/wanda.js, tag=万达电影

[MITM]
hostname = m.client.10010.com, act.10010.com, www.flyertea.com, www.duokan.com, tieba.baidu.com
ca-p12 = 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
ca-passphrase = FA1A9849
skip-server-cert-verify = false

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
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204
server_check_timeout = 2000
resource_parser_url=https://cdn.jsdelivr.net/gh/KOP-XIAO/QuantumultX@master/Scripts/resource-parser.js
profile_img_url=https://yattazen.com/favicon.ico
dns_exclusion_list = *.cmpassport.com, *.jegotrip.com.cn, *.icitymobile.mobi, id6.me, *.pingan.com.cn, *.cmbchina.com, *.localnetwork.uop, mfs.ykimg.com*.ttf, *.icbc.com.cn
geo_location_checker=http://api.live.bilibili.com/ip_service/v1/ip_service/get_ip_addr? , https://cdn.jsdelivr.net/gh/KOP-XIAO/QuantumultX@master/Scripts/IP_bili_cn.js

[dns]
;prefer-doh3
;doh-server = https://223.5.5.5/dns-query, https://223.6.6.6/dns-query
# > QuantumultX开启IPV6方法,删去下面的「no-ipv6」,在「VPN」栏中,开启「兼容性增强」
no-ipv6
no-system
server=223.5.5.5
server=119.29.29.29
server=114.114.114.114
server=/*.icloud.com/119.29.29.29
server=/*.icloud.com.cn/119.29.29.29
server=/*.tencent.com/119.29.29.29
server=/*.weixin.com/119.29.29.29

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
https://ddgksf2013.top/rewrite/StartUpAds.conf, tag=墨鱼去开屏2.0去广告@ddgksf2013, update-interval=86400, opt-parser=false, enabled=true
https://ddgksf2013.top/scripts/bdpan.ads.js, tag=百度网盘去广告@ddgksf2013, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/BilibiliAds.conf, tag=哔哩哔哩广告净化, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/YoutubeAds.conf, tag=Youtube去广告, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/XiaoHongShuAds.conf, tag=小红书净化, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/Function/UnblockURLinWeChat.conf, tag=微信解锁被屏蔽的URL@zZPiglet, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/Html/General.conf, tag=神机重定向, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/SmzdmAds.conf, tag=什么值得买净化, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/AmapAds.conf, tag=高德地图净化, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/dev/master/ForOwnUse.conf, tag=墨鱼专属VIP@ddgksf2013, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Scripts/master/coolapk.js, tag=酷安净化, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Scripts/master/pixivAds.js, tag=Pixiv去广告, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Scripts/master/12306.js, tag=12306去广告, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Snippet/GoogleCAPTCHA.snippet, tag=GoogleCAPTCHA, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/0honus0/SubconverterRule/master/QuantumultX/Conf/own.conf, tag=自定义规则, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/qiangxinglin/Emby/main/QuantumultX/emby.conf, tag=Emby Premiere, update-interval=86400, opt-parser=false, enabled=true
https://raw.githubusercontent.com/chavyleung/scripts/master/box/rewrite/boxjs.rewrite.quanx.conf, tag=BoxJS商店版@chavyleung, update-interval=86400, opt-parser=false, enabled=false

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

[mitm]
{% if request.key == "honus" %}
passphrase = 35BD5CC4
p12 = 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
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
{% if request.target == "singbox" %}

{
    "log": {
        "disabled": false,
        "level": "info",
        "timestamp": true
    },
    "dns": {
        "servers": [
            {
                "tag": "dns_proxy",
                "address": "tls://1.1.1.1",
                "address_resolver": "dns_resolver"
            },
            {
                "tag": "dns_direct",
                "address": "h3://dns.alidns.com/dns-query",
                "address_resolver": "dns_resolver",
                "detour": "DIRECT"
            },
            {
                "tag": "dns_fakeip",
                "address": "fakeip"
            },
            {
                "tag": "dns_resolver",
                "address": "223.5.5.5",
                "detour": "DIRECT"
            },
            {
                "tag": "block",
                "address": "rcode://success"
            }
        ],
        "rules": [
            {
                "outbound": [
                    "any"
                ],
                "server": "dns_resolver"
            },
            {
                "geosite": [
                    "category-ads-all"
                ],
                "server": "dns_block",
                "disable_cache": true
            },
            {
                "geosite": [
                    "geolocation-!cn"
                ],
                "query_type": [
                    "A",
                    "AAAA"
                ],
                "server": "dns_fakeip"
            },
            {
                "geosite": [
                    "geolocation-!cn"
                ],
                "server": "dns_proxy"
            }
        ],
        "final": "dns_direct",
        "independent_cache": true,
        "fakeip": {
            "enabled": true,
            {% if default(request.singbox.ipv6, "") == "1" %}
            "inet6_range": "fc00::\/18",
            {% endif %}
            "inet4_range": "198.18.0.0\/15"
        }
    },
    "ntp": {
        "enabled": true,
        "server": "time.apple.com",
        "server_port": 123,
        "interval": "30m",
        "detour": "DIRECT"
    },
    "inbounds": [
        {
            "type": "mixed",
            "tag": "mixed-in",
            {% if bool(default(global.singbox.allow_lan, "")) %}
            "listen": "0.0.0.0",
            {% else %}
            "listen": "127.0.0.1",
            {% endif %}
            "listen_port": {{ default(global.singbox.mixed_port, "2080") }}
        },
        {
            "type": "tun",
            "tag": "tun-in",
            "inet4_address": "172.19.0.1/30",
            {% if default(request.singbox.ipv6, "") == "1" %}
            "inet6_address": "fdfe:dcba:9876::1/126",
            {% endif %}
            "auto_route": true,
            "strict_route": true,
            "stack": "mixed",
            "sniff": true
        }
    ],
    "outbounds": [],
    "route": {
        "rules": [],
        "auto_detect_interface": true
    },
    "experimental": {
        "cache_file": {
            "enabled": true,
            "store_fakeip": true
        },
        "clash_api": {
            "external_controller": "{{ default(global.clash.external_controller, "127.0.0.1:9090") }}",
            "external_ui": "dashboard"
        }
    }
}

{% endif %}
