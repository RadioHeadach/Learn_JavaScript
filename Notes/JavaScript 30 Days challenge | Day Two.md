# JavaScript 30 Days challenge | Day Two

## CSS Part

```css
    html {
      background:#018DED url(http://unsplash.it/1500/1000?image=881&blur=50);
      background-size:cover;
      font-family:'helvetica neue';
      text-align: center;
      font-size: 10px;
    }

    body {
      margin: 0;
      font-size: 2rem;
      display:flex;
      flex:1;
      min-height: 100vh;
      align-items: center;
    }

    .clock {
      width: 30rem;
      height: 30rem;
      border:20px solid white;
      border-radius:50%;
      margin:50px auto;
      position: relative;
      padding:2rem;
      box-shadow:
        0 0 0 4px rgba(0,0,0,0.1),
        inset 0 0 0 3px #EFEFEF,
        inset 0 0 10px black,
        0 0 10px rgba(0,0,0,0.2);
    }

    .clock-face {
      position: relative;
      width: 100%;
      height: 100%;
      transform: translateY(-3px); /* account for the height of the clock hands */
    }

    .hand {
      width:50%;
      height:6px;
      background:black;
      position: absolute;
      top:50%;

      /* note1: the start point of rotation, default:50%*/
      transform-origin: 100%; 
      
      transform: rotate(90deg);

      /* note3: 如果使用这一行代码会使得再整秒、整分、整点的时候出现指针跳动的情况*/
      /* transition: all 0.05s;*/ 

      transition-timing-function: cubic-bezier(0.1, 2.7, 0.58, 1);
    }
```

### `transform-origin`

`transform-origin`可以改变被转换元素的位置。

该属性默认为`transform-origin: 50%`。

| 值 | 描述 |
| ------------- | ------------- |
| x-axis | 定义视图被置于 X 轴的何处。可能的值：`left` `center` `right` `length` `%` |
| y-axis | 定义视图被置于 Y 轴的何处。可能的值：`top` `center` `bottom` `length` `%` |
| z-axis | 定义视图被置于 Z 轴的何处。可能的值：`length` |

### `transform: rotate(90deg)`

改变元素的默认方向，如果增加这一属性并旋转90度，起始角度将在0点0分0秒。如果不增加该属性，默认横向指向九点方向。

### `transition`

`transition` 属性是一个简写属性，用于设置四个过渡属性：

`transition-property`
`transition-duration`
`transition-timing-function`
`transition-delay`

## JavaScript 部分

### Code

```js
const secondHand = document.querySelector('.second-hand');
const minsHand = document.querySelector('.min-hand');
const hoursHand = document.querySelector('.hour-hand');

function setDate() {
  const now = new Date();

  const seconds = now.getSeconds();
  const mins = now.getMinutes();
  const hours = now.getHours();
  /* note2: 这里加90度的原因是上面css transform: rotate(90deg)，如果不加90度就会导致指针落后90度*/
  const secondsDegrees = ((seconds / 60) * 360) + 90;
  secondHand.style.transform = `rotate(${secondsDegrees}deg)`;

  const minDegrees = (mins / 60) *360 + 90;
  minsHand.style.transform = `rotate(${minDegrees}deg)`;

  const hoursDegrees = (hours / 12) *360 + 90;
  hoursHand.style.transform = `rotate(${hoursDegrees}deg)`;


}

setInterval(setDate, 1000);

setDate();
```

