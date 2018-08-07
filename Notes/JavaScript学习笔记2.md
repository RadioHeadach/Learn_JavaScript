# JavaScript学习笔记 2

<!-- MarkdownTOC -->

- JavaScript可以做什么？
- JavaScript的API
	- 浏览器API
	- 第三方API
- 代码示例

<!-- /MarkdownTOC -->


## JavaScript可以做什么？

JavaScript 语言的核心包含一些普遍的编程特点，以让你可以做到如下的事情：

- 在变量中储存有用的值。以上面的演示做例子，我们请求输入一个新的名字，然后把那个名字储存到一个叫 name 的变量.

- 对一段文本（在编程中被称为 “字符串”）进行操作。在上面的例子中，我们取出字符串 "Player 1:"，然后把它和 name 变量连结起来，创造出完整的文本标签，例：''Player 1: Chris"。

- 运行代码以响应在网页中发生的特定事件。在上述的例子中，我们用了一个 `click` 事件来检测按钮什么时候被点击，然后运行更新文本标签的代码。

## JavaScript的API

### 浏览器API

浏览器 APIs (Browser APIs) 已经安装在你的网页浏览器中，而且能够从周围的计算机环境中揭露数据，或者做有用的复杂事情。举个例子：

- 文档对象模型 API [DOM (Document Object Model) API] 允许你操作 HTML 和 CSS，创建，移除和修改 HTML，动态地应用新的样式到你的页面，等等。比如说每次你在一个页面里看到一个弹出窗口，或者显示一些新的内容（像我们在上面的简单演示中看到那样），这就是 DOM 在运作。

- 地理定位 API [Geolocation API] 获取地理信息。这就是为什么谷歌地图可以找到你的位置，而且标示在地图上。

- 画布 [Canvas] 和 WebGL APIs 允许你创建生动的 2D 和 3D 图像。人们正运用这些网页技术进行一些令人惊叹的事情——比如说 Chrome Experiments 和 webglsamples。

- 音像和影像 API，像  HTMLMediaElement 和 WebRTC  允许你运用多媒体去做一些非常有趣的事情，比如在网页中播放音像和影像，或者从你的网页摄像头中获取获取录像，然后在其他人的电脑上展示（尝试我们的简单快照演示以理解这个概念）。

### 第三方API

- Twitter API
- Google Maps API

## 代码示例

```html
<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
		<title>Apply JavaScript example</title>
		<script>
			document.addEventListener("DOMContentLoaded", function() {
				function createParagraph() {
					var para = document.createElement('p');
					para.textContent = 'You clicked the button!';
					document.body.appendChild(para);
				}
				var buttons = document.querySelectorAll('button');
				for(var i = 0; i < buttons.length ; i++) {
					buttons[i].addEventListener('click', createParagraph);
				}
			});
		</script>
	</head>
	<body>
		<h1>Test JavaScript</h1>
		<button>Click me</button>
	</body>
</html>```


