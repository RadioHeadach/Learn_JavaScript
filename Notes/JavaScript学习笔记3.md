# JavaScript学习笔记3 | 随机笑话网页

## 概述

- 当用户按下“Generate random story”按钮时，生成一则笑话。

- 当且仅当在按钮被按下前用户在“Enter custom name”中输入了其名字的情况下，将默认的名字变成用户的名字。

- 当用户在按下生成按钮之前点击了UK radio按钮时，将默认的US重量和温度单位换成英式的。

- 如果用户再次按下生成按钮，则随即生成另一则笑话（如果用户愿意的话，他可以一直按生成按钮）

![预览图](https://mdn.mozillademos.org/files/13667/assessment-1.png) 

## HTML代码

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width">

    <title>Silly story generator</title>

    <style>
    body {
      font-family: helvetica, sans-serif;
      width: 350px;
    }
    label {
      font-weight: bold;  
    }
    div {
      padding-bottom: 20px;
    }
    input[type="text"] {
      padding: 5px;
      width: 150px;
    }
    p {
      background: #FFC125;
      color: #5E2612;
      padding: 10px;
      visibility: hidden;
    }
    </style>
  </head>

  <body>
    <div>
      <label for="customname">Enter custom name:</label>
      <input id="customname" type="text" placeholder="">
    </div>
    <div>
      <label for="us">US</label><input id="us" type="radio" name="ukus" value="us" checked>
      <label for="uk">UK</label><input id="uk" type="radio" name="ukus" value="uk">
    </div>
    <div>
      <button class="randomize">Generate random story</button>
    </div>
    <!-- Thanks a lot to Willy Aguirre for his help with the code for this assessment -->
    <p class="story"></p>

    <script src="main.js"></script>

  </body>
</html>
```

## JS代码

```js
var customName = document.getElementById('customname');
var randomize = document.querySelector('.randomize');
var story = document.querySelector('.story');

function randomValueFromArray(array){
  return array[Math.floor(Math.random()*array.length)];
}

var storyText = "It was 94 fahrenheit outside, so :insertx: went for a walk. When they got to :inserty:, they stared in horror for a few moments, then :insertz:. Bob saw the whole thing, but was not surprised — :insertx: weighs 300 pounds, and it was a hot day."
var insertX = ['Willy the Goblin', 'Big Daddy', 'Father Christmas'];
var insertY = ['the soup kitchen', 'Disneyland', 'the White House'];
var insertZ = ['spontaneously combusted', 'melted into a puddle on the sidewalk', 'turned into a slug and crawled away'];

randomize.addEventListener('click', result);

function result() {
	var newStory = storyText;

	var xItem = randomValueFromArray(insertX);
	var yItem = randomValueFromArray(insertY);
	var zItem = randomValueFromArray(insertZ);

  	newStory = newStory.replace(':insertx:', xItem);
  	newStory = newStory.replace(':insertx:', xItem);
	newStory = newStory.replace(':inserty:', yItem);
	newStory = newStory.replace(':insertz:', zItem);

	console.log(newStory);

	if(customName.value !== '') {
	  var name = customName.value;
	  newStory = newStory.replace('Bob', name);

	}

	if(document.getElementById("uk").checked) {
	  var weight = Math.round(300 * 0.0714286) + ' stone';
	  var temperature =  Math.round((94 - 32) * 5 / 9) + ' centigrade';
	  newStory = newStory.replace('94 fahrenheit', temperature);
	  newStory = newStory.replace('300 pounds', weight);

	}

	story.textContent = newStory;
	story.style.visibility = 'visible';
}
```

## 技巧

- 如果你不确定 JavaScript 是否添加到了你的 HTML 中，试试暂时删除 main.js 文件中的所有东西，而加上一点点非常简单的但是会有非常明显的影响的 JavaScript 语句，然后保存文件并刷新浏览器。下面的例子会让页面背景转化为红色，如果你的 JavaScript 被加载到了 HTML 中去的话。


- `document.querySelector('html').style.backgroundColor = 'red';`

- `Math.round()` 是 JavaScript 中的内建函数，用来生成最接近一个计算式的整数。
有三种需要被替换的字符串实例。您可以多次重复 replace() 方法，或者您可以使用正则表达式。例如，var text = 'I am the biggest lover, I love my love'; text.replace(/love/g,'like'); 会将“love”的所有实例替换为“like”。记住,字符串是不可变的!
