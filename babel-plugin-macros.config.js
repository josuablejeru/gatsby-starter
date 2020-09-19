// babel-plugin-macros.config.js
module.exports = {
  twin: {
    config: "tailwind.config.js",
    preset: "emotion",
    debugProp: true,
    debugPlugins: false,
    debug: false,
  },
}

/* debugProp
   Add a prop to your elements in development so you can see the original tailwind classes
   eg: <div data-tw="bg-black" />
*/
