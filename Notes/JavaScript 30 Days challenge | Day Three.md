# JavaScript 30 Days challenge | Day Three

## Code

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Scoped CSS Variables and JS</title>
</head>
<body>
  <h2>Update CSS Variables with <span class='hl'>JS</span></h2>

  <div class="controls">
    <label for="spacing">Spacing:</label>
    <input id="spacing" type="range" name="spacing" min="10" max="200" value="10" data-sizing="px">

    <label for="blur">Blur:</label>
    <input id="blur" type="range" name="blur" min="0" max="25" value="10" data-sizing="px">

    <label for="base">Base Color</label>
    <input id="base" type="color" name="base" value="#ffc600">
  </div>

  <img src="https://source.unsplash.com/7bwQXzbF6KE/800x500">

  <style>
    /*
    root选择器

    root 选择器匹配文档根元素。
    在 HTML 中，根元素始终是 html 元素。
    */
    :root {
      --base:#ffc600;
      --spacing:10px;
      --blur:10px;
    }

    img{
      padding: var(--spacing);
      background: var(--base);
      filter: blur(var(--blur));
    }

    .hl {
      color: var(--base);
    }
    /*
      misc styles, nothing to do with CSS variables
    */

    body {
      text-align: center;
      background: #193549;
      color: white;
      font-family: 'helvetica neue', sans-serif;
      font-weight: 100;
      font-size: 50px;
    }

    .controls {
      margin-bottom: 50px;
    }

    input {
      width:100px;
    }
  </style>

  <script>

    // `querySelectorAll` will return an `Node list`, not an array, `Node list` dosen't have the array's methods.
    const inputs = document.querySelectorAll('.controls input');

    function handleUpdate() {
      const suffix = this.dataset.sizing || '';
      document.documentElement.style.setProperty(`--${this.name}`, this.value + suffix);
    }

    inputs.forEach(input => input.addEventListener('change', handleUpdate));
    inputs.forEach(input => input.addEventListener('mousemove', handleUpdate));


  </script>

</body>
</html>

```


## CSS变量

### 变量的声明

```css
:root {
  --base:#ffc600;
  --spacing:10px;
  --blur:10px;
}		
```

在变量名前加两根连词线`--`。

### 变量的使用

使用`var()`函数读取变量。

```css
img{
  padding: var(--spacing);
  background: var(--base);
  filter: blur(var(--blur));
}
```

`var()`函数还可以使用第二个参数，表示变量的默认值。如果该变量不存在，就会使用这个默认值。