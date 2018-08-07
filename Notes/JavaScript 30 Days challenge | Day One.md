# JavaScript 30 Days challenge | Day One

[![Jietu20180807-152301.jpg](https://i.loli.net/2018/08/07/5b6948e1dbf8c.jpg)](https://i.loli.net/2018/08/07/5b6948e1dbf8c.jpg)

## 工具

- http://keycode.info/ 查看键盘每个键位对应的数字

```js
const audio = document.querySelector('audio[data-key="${e.keyCode}"]'); //错误！
const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`); //正确！

/*
	应使用``斜引号，不使用''单引号
*/
```

## HTML Part

### `data` Attribute

#### HTML file

```html
  <div class="keys">
    <div data-key="65" class="key">
      <kbd>A</kbd>
      <span class="sound">clap</span>
    </div>
    <div data-key="83" class="key">
      <kbd>S</kbd>
      <span class="sound">hihat</span>
    </div>
    <div data-key="68" class="key">
      <kbd>D</kbd>
      <span class="sound">kick</span>
    </div>
    <div data-key="70" class="key">
      <kbd>F</kbd>
      <span class="sound">openhat</span>
    </div>
    <div data-key="71" class="key">
      <kbd>G</kbd>
      <span class="sound">boom</span>
    </div>
    <div data-key="72" class="key">
      <kbd>H</kbd>
      <span class="sound">ride</span>
    </div>
    <div data-key="74" class="key">
      <kbd>J</kbd>
      <span class="sound">snare</span>
    </div>
    <div data-key="75" class="key">
      <kbd>K</kbd>
      <span class="sound">tom</span>
    </div>
    <div data-key="76" class="key">
      <kbd>L</kbd>
      <span class="sound">tink</span>
    </div>
  </div>

```

#### Introduction

The `data-*` attributes is used to store custom data private to the page or application.


The `data-*` attributes gives us the ability to embed custom data attributes on all HTML elements.

The stored (custom) data can then be used in the page's JavaScript to create a more engaging user experience (without any Ajax calls or server-side database queries).

`data-*`由两部分组成：

1. The attribute name should not contain any uppercase letters, and must be at least one character long after the prefix "data-"

2. The attribute value can be any string

**注意** :Custom attributes prefixed with "data-" will be completely ignored by the user agent.

#### Usage

该页面使用`data-key="65"`来绑定特定的按键。

```js
window.addEventListener('keydown', function(e) {
	console.log(e);
});

```

查看以上代码的输出可以看到每一个按键对应的Keycode
[![Jietu20180807-152220.jpg](https://i.loli.net/2018/08/07/5b6948dfdf067.jpg)](https://i.loli.net/2018/08/07/5b6948dfdf067.jpg)

### `audio` Attribute

```html
  <audio data-key="65" src="sounds/clap.wav"></audio>
  <audio data-key="83" src="sounds/hihat.wav"></audio>
  <audio data-key="68" src="sounds/kick.wav"></audio>
  <audio data-key="70" src="sounds/openhat.wav"></audio>
  <audio data-key="71" src="sounds/boom.wav"></audio>
  <audio data-key="72" src="sounds/ride.wav"></audio>
  <audio data-key="74" src="sounds/snare.wav"></audio>
  <audio data-key="75" src="sounds/tom.wav"></audio>
  <audio data-key="76" src="sounds/tink.wav"></audio>
```

The `<audio>` tag defines sound, such as music or other audio streams.

Currently, there are 3 supported file formats for the <audio> element: MP3, WAV, and OGG

## JavaScript Part

### Full script

```js
function playSound(e) {
  const audio = document.querySelector(`audio[data-key="${e.keyCode}"]`);
  const key = document.querySelector(`.key[data-key="${e.keyCode}"]`); 
  if (!audio) return; //如果某个按键没有audio的attribute，就停止。
  audio.currentTime = 0; //TODO:为什么要currentTime?
  audio.play();
  key.classList.add('playing');
}

function removeTransition(e) {
  if(e.propertyName !== 'transform') return; //选择变形
  console.log(e.propertyName);
  this.classList.remove('playing');
}

const keys = document.querySelectorAll('.key');
keys.forEach(key => key.addEventListener('transitionend', removeTransition));
window.addEventListener('keydown', playSound);
```

### `document.querySelector()`

`querySelector()` 方法返回匹配指定 CSS 选择器元素的第一个子元素 。

**注意**： `querySelector()` 方法只返回匹配指定选择器的第一个元素。如果你要返回所有匹配元素，请使用 querySelectorAll() 方法替代。

### Arrow functions

```js
x => x * x;
```

箭头函数相当于匿名函数，并且简化了函数定义。箭头函数有两种格式，一种像上面的，只包含一个表达式，连`{ ... }`和`return`都省略掉了。还有一种可以包含多条语句，这时候就不能省略`{ ... }`和`return`。

