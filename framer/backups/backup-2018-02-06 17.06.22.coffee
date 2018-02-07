# Set Screen background
Screen.backgroundColor = "#f5f5f5"


#初始化
receiptsStart = 30000
receiptsMax = receiptsStart+4000

#屏幕A
screenA = new Layer
	size: Screen.size
	backgroundColor: "transparent"
	z: 3


scroll = new ScrollComponent
	scrollHorizontal: false
	parent: screenA
	width: Screen.width,
	height: Screen.height-128
	y: 128

#滚动距离不够，补足滚动页面长度
content_bg = new Layer
	parent: scroll.content
	width: Screen.width
	height: Screen.height*1.4
	backgroundColor: "#F5F5F5"




#导航
navigationBariOSBack = new Layer
	x: 0
	y: 0
	width: 750
	height: 128
	image: "images/Nav.png"
	z: 3


navigationBariOSBackAnimate = new Animation
	layer:navigationBariOSBack
	properties:
		opacity:0
	curve:"spring(1200,20,0)"
	time:0.2	

navigationBariOSBackAnimate1 = navigationBariOSBackAnimate.reverse()




#反色导航	
rednavbar = new Layer
	x: 0
	y: 0
	width: 750
	height: 128
	image: "images/Nav_red.png"
	z: 5
	opacity: 0

	
rednavbar_sum = new TextLayer
	parent: rednavbar
	x: 336
	y: 74
	text: receiptsStart
	fontSize: 36
	fontFamily: "DIN Alternate"
	fontWeight: 700
	letterSpacing: 0.0
	textAlign: "center"
	color: "rgba(255,255,255,1)"

rednavbar_title = new TextLayer
	parent: rednavbar
	x: Align.center
	y: 40
	text: "大额借可借额度(元)"
	fontSize: 24
	fontFamily: "PingFang SC"
	fontWeight: 300
	letterSpacing: 0.0
	lineHeight: 1.5
	textAlign: "center"
	color: "rgba(255,255,255,1)"

rednavbarAnimate = new Animation
	layer:rednavbar
	properties:
		opacity:1
	curve:"spring(1200,20,0)"
	time:0.2	

rednavbarAnimate1 = rednavbarAnimate.reverse()




#悬浮button
bottom_btn = new Layer
	x: 0
	y: Align.bottom
	backgroundColor: "#FFF"
	width: Screen.width
	height: 144
	z: 3
	shadowColor: "rgba(255,82,100,0.3)"
	shadowX: 0
	shadowY: 8
	shadowBlur: 18
	shadowSpread: 0



button = new Layer
	parent: bottom_btn
	x: Align.center
	y: Align.center(4)
	backgroundColor: "transparent"
	width: 678
	height: 88
	image: "images/button.png"
	opacity: 0.3


button.states.a =
	opacity: 0.30


#大额借可借额度
sumLimit = new Layer
	parent: scroll.content
	x: 0
	backgroundColor: "transparent"
	width: 750
	height: 360

sum_bg = new Layer
	parent: sumLimit
	x: 0
	y: 0
	width: 750
	height: 358.2610359175475
	backgroundColor: "rgba(255,255,255,1)"

title = new TextLayer
	parent: sumLimit
	x: 194
	y: 86
	width: 326.2267188700422
	text: "大额借可借额度(元)"
	fontSize: 36
	fontFamily: "PingFang SC"
	fontWeight: 300
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "center"
	color: "rgba(117,117,117,1)"

receipts = new TextLayer
	parent: sumLimit
	x: Align.center
	y: 170
	text: "30000"
	fontSize: 128
	fontFamily: "DIN Alternate"
	fontWeight: 700
	letterSpacing: 0.0
	lineHeight: 0.75
	textAlign: "center"
	color: "rgba(66,66,66,1)"

head = new Layer
	parent: scroll.content
	x: 0
	y: 358
	backgroundColor: "transparent"
	width: 750
	height: 64

rectangle2 = new Layer
	parent: head
	x: 0
	y: 0
	width: 750
	height: 64
	backgroundColor: "rgba(245,245,245,1)"

head = new TextLayer
	parent: head
	x: 32
	y: Align.center
	text: "认证越多、提额越高、审核越快"
	fontSize: 28
	fontFamily: ".PingFang SC"
	fontWeight: 400
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "left"
	color: "rgba(158,158,158,1)"


#屏幕B
screenB = new Layer
	size: Screen.size
	backgroundColor: "#FFF"
	y: Screen.height
	z: 5


#添加屏幕B切屏状态	
screenB.states.a =
	y:0
	options: 
		curve: Spring(tension: 250, friction: 25)
	time:0.12		

screenB.states.b =
	y:Screen.height
	options: 
		curve: Spring(tension: 250, friction: 25)
	time:0.12	

#屏幕B返回
screenB_back = new Layer
	parent: screenB
	x: 16
	y: 58
	width: 48
	height: 48
	image: "images/back.png"

#状态栏
statusbar = new Layer
	parent: screenB
	x: 12
	y: 6
	width: Screen.width
	height: 20
	image: "images/statusbar.png"


#屏幕B头像
avatar = new Layer
	parent: screenB
	x: Align.center
	y: 368
	width: 260
	height: 260
	backgroundColor: "#FFF"
	borderRadius: 130
	borderColor: "#f5f5f5"
	borderWidth: 2
	image: ""
	

#认证按钮
certify = new Layer
	parent: screenB
	x: Align.center
	y: 836
	backgroundColor: "transparent"
	width: 320
	height: 94
	image: "images/certify_btn.png"
	z: 2


	
	
#列表


#列表icon
list_icons_images = ["images/list_icon1.png","images/list_icon2.png","images/list_icon3.png","images/list_icon4.png","images/list_icon5.png","images/list_icon6.png","images/list_icon7.png"]

#列表辅助描述
list_disc_texts = ["认证京东账号","认证支付宝账号","认证个人征信账号","认证社保账号","认证公积金账号","认证人寿保险账号","认证车险账号",]

#开关判断认证按钮是否置灰
backSwitch = true

#金额动画
start = [receiptsStart,receiptsStart]
maxium = [receiptsMax,receiptsMax]
moneyCount = (i,countLayer) ->
	if start[i] < maxium[i]
		Utils.delay receiptsStart*0.000000001, ->
			showNumber = Utils.round(start[i],0)
			countLayer.text = showNumber.toFixed(0)
			start[i] = start[i]+maxium[i]/500
			moneyCount(i,countLayer)
	else 
		maxium[i]+=4000


#金币动画
listcurrentY = 416
coinbgs = []
lists = []



for n in [0...8]
	coinbg = new Layer
		width: Screen.width/2
		height: Screen.width/2
		x: Align.right(40)
		y: listcurrentY
		backgroundColor: "000"
		z: 5
		opacity: 1
		backgroundColor: "transparent"
		originX: 0.5
		scale: 0.4
		opacity: 0
		
	
	coinbgs.push(coinbg)
	
	coin = new Layer
		x: Align.right
		parent: coinbgs[n]
		width: 72
		height: 72	
		image: "images/coins.gif"
		rotation: -45
	
#ScreenB 
certify.onTouchEnd (event, layer) ->
# 	certify.states.switch("a")
# 	print scroll.content.y
	for j in [0...7]
		if list_icons_images[j] == screenB.children[2].image
			listcurrentY = lists[j].y+scroll.content.y
			
			
	for n in [0...8]
		coinbgAnimate = new Animation coinbgs[n],
			rotation:225
			opacity: 1
			scale: 1
			options: 
				delay:0.02*n
				time: 0.12
		
		coinbgAnimateB = new Animation coinbgs[n],
			y: 0
			opacity: 0
			options: 
				delay:0.04*n
				curve: "spring(500,32,0)"
				time: 0.12
						
		coinbgAnimate.on Events.AnimationEnd, coinbgAnimateB.start
		coinbgAnimate.start()
	
	Utils.delay 0.2, ->
		moneyCount(0,receipts)
		moneyCount(1,rednavbar_sum)
	screenB.states.switch("b")
	screenA.visible = true
	button.opacity = 1
# 	toast_txt.text = "成功提额"+[Utils.round(receipts.text)-receiptsStart+4000]+"元额度"
	toast_txt.text = "成功提额"+(maxium[0]-start[0])+"元额度"
	Utils.delay 0.5, ->
		toastbgAnimate.start()
	Utils.delay 2, ->
		toastbgAnimateBack.start()


#金币特效


	




for i in [0...7]
	list = new Layer
		parent: scroll.content
		x: 0
		y: 416+144*i
		backgroundColor: "#FFF"
		width: 750
		height: 144


	list_title = new TextLayer
		parent: list
		x: 138
		y: Align.center
		width: 414
		text: list_disc_texts[i]
		fontSize: 32
		fontFamily: "PingFang SC"
		fontWeight: 400
		letterSpacing: 0.0
		lineHeight: 1
		textAlign: "left"
		color: "rgba(66,66,66,1)"
	
# 	list_disc = new TextLayer
# 		parent: list
# 		x: 138
# 		y: 86
# 		width: 308
# 		text: list_disc_texts[i]
# 		fontSize: 28
# 		fontFamily: "PingFang SC"
# 		fontWeight: 300
# 		lineHeight: 1
# 		textAlign: "left"
# 		color: "rgba(158,158,158,1)"
	
	list_icon = new Layer
		parent: list
		x: 40
		y: Align.center
		backgroundColor: "transparent"
		width: 48
		height: 48
		image: list_icons_images[i]
	
	line = new Layer
		parent: list
		x: 142
		y: 144
		width: 607.9999999999994
		height: 0.5


	
	list_btn = new Layer
		parent: list
		x: Align.right(-32)
		y: 48
		width: 140	
		height: 56
		image: "images/list_btn.png"
		borderRadius: 28


	lists.push(list)
	
	
			
	
	list.onTouchEnd (event, layer) ->

		backSwitch = true
		for j in [0...7]
			if list_icons_images[j] == screenB.children[2].image
				listcurrentY = lists[j].y+scroll.content.y
# 				print listcurrentY
		for n in [0...8]
			coinbgs[n].width = screen/2
			coinbgs[n].height = screen/2
			coinbgs[n].scale = 0.4
			coinbgs[n].y = listcurrentY
			coinbgs[n].rotation = 0
			
		if backSwitch = true
			this.children[3].image = "images/list_btn_ed.png"
			avatar.image = this.children[1].image
			screenB.states.switch("a")
			screenA.visible = false	
# 			certify.states.switch("default")
			this.ignoreEvents = true
		else
			this.children[4].image = "images/list_btn.png"	
			
	screenB_back.onTouchStart (event, layer) ->
		backSwitch = false
		screenB.states.switch("b")
		screenA.visible = true
# 		print backSwitch
# 		print screenB.children[2].image
		for j in [0...7]
			if list_icons_images[j] == screenB.children[2].image
				lists[j].children[4].image = "images/list_btn.png"
				lists[j].ignoreEvents = false
				listcurrentY = lists[j].y+scroll.content.y
	
	#点击导航头部重置数据			
	navigationBariOSBack.onTouchEnd (event, layer) ->
		receiptsStart = 30000
		receipts.text = receiptsStart
		rednavbar_sum.text = receiptsStart
		#初始化金额滚动前后范围值
		start = [receiptsStart,receiptsStart]
		maxium = [receiptsMax,receiptsMax]
		backSwitch = true
		button.states.switch("default")
		#清空数据提示
		toast_txt.text = "测试数据初始化成功"
		Utils.delay 0.5, ->
			toastbgAnimate.start()
		Utils.delay 2, ->
			toastbgAnimateBack.start()
		#清楚禁用状态和禁用样式
		for k in [0...7]
			lists[k].ignoreEvents = false
			lists[k].children[4].image = "images/list_btn.png"
			
			
# 	rednavbar.onTouchEnd (event, layer) ->
# 		receiptsStart = 30000
# 		receipts.text = receiptsStart
# 		#初始化金额滚动前后范围值
# 		start = [receiptsStart,receiptsStart]
# 		maxium = [receiptsMax,receiptsMax]
# 		backSwitch = true
# 		#清楚禁用状态和禁用样式
# 		for k in [0...7]
# 			lists[k].ignoreEvents = false
# 			lists[k].children[4].image = "images/list_btn.png"		


	
#info
info = new Layer
	parent: sumLimit
	x: 520
	y: 72
	width: 64
	height: 64
	image: "images/info.png"


#toast

toast = new Layer
	parent: info
	x: -372
	scale: 0.75
	opacity: 0
	originX: 0.56
	options: 
		curve: "spring(500,10,0)"
	
rec = new Layer
	parent: toast
	x: 0
	y: 16.53600842248852
	width: 652
	height: 149.39505234641715
	backgroundColor: "rgba(67,62,77,1)"
	borderRadius: 8

path = new Layer
	parent: toast
	x: info.x-info.width/2
	y: 6
	width: 36
	height: 15.428117358161417
	backgroundColor: "transparent"
	opacity: 0.96
	image: "images/Path.png"

layer = new TextLayer
	parent: toast
	x: 20
	y: 48
	width: 590
	text: "可借额度=总额度-未还的借款本金
(未还的借款本金包括麦子金服其他app的借款)"
	fontSize: 28
	fontFamily: ".PingFang SC"
	fontWeight: 400
	letterSpacing: 0.0
	lineHeight: 1.5714285714285714
	textAlign: "center"
	color: "rgba(255,255,255,1)"
	

toast.states.a =
	x: -472
	backgroundColor: "transparent"
	opacity: 0.96
	options: 
		curve: "spring(500,24,0)"
		time: 0.5
	y: 64
	scale: 1


toast.states.b =
	opacity: 0
	backgroundColor: "transparent"
	options: 
		curve: "spring(500,24,0)"
		time:0.5
	x: -372
	y: 50
	scale: 0.75
	originX: 0.56
	width: 112
	height: 112

scroll.on Events.Move, ->
	if scroll.content.y < -200
		navigationBariOSBackAnimate.start()
		rednavbarAnimate.start()
	else
		navigationBariOSBackAnimate1.start()
		rednavbarAnimate1.start()		
	
info.onTouchStart (event, layer) ->
	toast.states.next("a","b")	



	



#toast

toastbg = new Layer
	opacity: 0
	x: Align.center
	y: 128
	width: 420
	height: 88
	backgroundColor: "transparent"
	image: "images/toastbg.png"
	z: 6

toast_txt = new TextLayer
	parent: toastbg
	x: 82
	y: 30
	width: 298.75447792364685
	text: "认证成功"+"额度"
	fontSize: 28
	fontFamily: ".PingFang SC"
	fontWeight: 400
	letterSpacing: 0.0
	lineHeight: 1
	textAlign: "left"
	color: "rgba(255,255,255,1)"
	
	

toastbgAnimate = new Animation toastbg,
	opacity: 1
	y: 148
	options: 
		curve: "spring(500,32,0)"
		time:100

toastbgAnimateBack = toastbgAnimate.reverse()
# toastbgAnimateBack.time = 0.3
# toastbgAnimate.on Events.AnimationEnd,toastbgAnimateBack.start
	
