---@meta


---@class base.ui
base.ui = {}



---@alias UI.PositionType
--- 相对定位。控件位置会直接使用position，且不再参与排版。
---|'relative'
--- 绝对定位。当排版完成后，控件位置会根据position进行偏移。
---|'absolute'

--- 子控件排列方式
---@alias UI.Direction
--- 横向排列
---|'row'
--- 竖向排列
---|'col'

--- 子控件排列方式
---@alias UI.AlignContent
--- 居左 | 局上
---|'start'
--- 居中
---|'center'
--- 居右 | 居下
---|'end'
--- 均匀分布，两边对齐
---|'space_between'
--- 均匀分布
---|'space_around'
--- 将未定义宽度的子元素拉伸置列宽 | 将未定义高度的子元素拉伸置行高
---|'stretch'

---@alias UI.AlignSelf
--- 居左 | 局上
---|'start'
--- 居中
---|'center'
--- 居右 | 居下
---|'end'
--- 宽度未定义的话将宽度拉伸至列宽 | 高度未定义的话将高度拉伸至行高
---|'stretch'
---



---边框
---@class UI.Border
---@field top? number
---@field bottom? number
---@field left? number
---@field right? number


---控件布局
---@class UI.Layout
---宽度
---@field width? number
---@field height? number
---@field width_grow? number
---@field height_grow? number
---@field grow_width? number
---@field width_shrink? number
---@field height_shrink? number
---@field margin? number | UI.Border
---@field padding? number | UI.Border
---@field position_type? UI.PositionType
---@field position? [number,number]
---@field direction? UI.Direction
---@field row_content? UI.AlignContent
---@field col_content? UI.AlignContent
---@field row_self? UI.AlignSelf
---@field col_self? UI.AlignSelf
---@field ratio? [number, number]


---内置曲线函数
---@alias UI.Curve
--- 直线
---|'linear'
---
---|'ease'
--- 缓入
---|'ease_in'
--- 缓出
---|'ease_out'
--- 缓入缓出
---|'ease_in_out'



---@class UI.TransitionProps
---
---过渡时间
---
---@field time? number
---
--- 曲线函数
---
---@field func? UI.Curve | [number,number,number,number]
---
--- 当指定 position 的过渡效果时，可以自定义控件的运动轨迹
---
--- 指定过渡效果为曲线
---
--- func = 'curve',
---
--- 曲线路径上的锚点，锚点决定控件的运动轨迹
---
--- 锚点值为绝对坐标
---
---@field anchors? [number,number][]

---自定义数值过渡
---@class UI.TransitionPropsCustom
---@field time? number
---@field func? UI.Curve | [number,number,number,number]
---@field from? number
---@field to? number
---@field callback? fun(value: number): nil


---@class UI.Transition
---@field size? UI.TransitionProps             #当控件大小改变时生效（包括宽度改变和高度改变）
---@field position? UI.TransitionProps         #当控件位置改变时生效（包括x轴偏移和y轴偏移）
---@field show? UI.TransitionProps             #当控件显示状态改变时生效（包括隐藏和显示）
---@field opacity? UI.TransitionProps          #当控件透明度改变时生效
---@field rotate? UI.TransitionProps           #当控件旋转角度改变时生效
---@field scale? UI.TransitionProps            #当控件缩放比例改变时生效(包括横向缩放和纵向缩放）
---@field progress? UI.TransitionProps         #当进度条进度改变时生效（仅对进度条控件有效）
---@field custom? UI.TransitionPropsCustom     #自定义数值过渡




---控件事件
---@class UI.Events
---
---鼠标进入
---
---@field on_mouse_enter? fun(self:base.UI): nil
---
---鼠标离开
---
---@field on_mouse_leave? fun(self:base.UI): nil
---
---鼠标按钮按下
---
---@field on_mouse_down? fun(self:base.UI): nil
---
---鼠标按钮抬起
---
---@field on_mouse_up? fun(self:base.UI): nil
---
---点击（在控件内鼠标按键按下后抬起时触发）
---
---@field on_click? fun(self:base.UI): nil
---
---双击（PC only）
---
---@field on_double_click? fun(self:base.UI): nil
---
---长按
---
---长按事件触发后，点击事件不会被触发
---
---可以通过 base.ui.event.set_long_click_timeout 来修改触发长按的延迟事件，单位为毫秒
---
---@field on_long_click? fun(self:base.UI): nil
---
---长按松开
---
---触发了长按事件之后才会触发长按松开事件
---@field on_long_click_release? fun(self:base.UI): nil
---
---输入框文本变化事件
---
---@field on_input? fun(self:base.UI, text:string): nil
---
---输入框获取焦点
---
---@field on_focus? fun(self:base.UI): nil
---
---输入框失去焦点
---
---@field on_focus_lose? fun(self:base.UI): nil
---
---拖动
---
---当开始拖动控件时触发。 需要指定属性 enable_drag = true
---
---@field on_drag? fun(self:base.UI): nil
---
---松开拖动的控件，会在松开控件的时候触发，拥有一个参数 target，代表松开鼠标时鼠标所指向的控件。
---
---松开鼠标时，鼠标指向的控件需要指定属性 enable_drop = true 才会触发此事件，否则会触发 on_throw事件。
---
---on_drop 事件的触发控件对象是被拖动的控件。
---
---target 控件则会触发 on_dropped，拥有一个参数 source ，代表被拖动的控件
---@field on_drop? fun(self:base.UI, target:base.UI): nil
---@field on_dropped? fun(self:base.UI, source:base.UI): nil
---
---当控件被拖放到空白区域上或没有指定 enable_drop = true 的控件上时，会触发此事件
---
---@field on_throw? fun(self:base.UI): nil


---控件属性
---@class UI.BaseProp
---@field type? string
---@field name? string
---@field show? boolean
---@field color? string
---@field scale? number
---@field clip? boolean
---@field enable_drag? boolean
---@field enable_drop? boolean
---@field image? string
---@field flip_x? boolean
---@field flip_y? boolean
---@field border? number | UI.Border
---@field round_corner_radius? number
---@field mask_image? string
---@field rotate? number
---@field static? boolean
---@field disabled? boolean
---@field swallow_event? boolean
---@field swallow_events? string
---@field z_index? number
---@field low_level? boolean
---@field bind? table
---@field event? UI.Events
---
---布局
---
---@field layout? UI.Layout
---
---过渡
---
---(过渡 | 星火编辑器文档-https://doc.sce.xd.com/%E6%8A%80%E6%9C%AF%E6%96%87%E6%A1%A3/%E5%AE%A2%E6%88%B7%E7%AB%AFLua%20API/%E5%86%85%E7%BD%AE%E6%8E%A7%E4%BB%B6/%E8%BF%87%E6%B8%A1)
---
---@field transition? UI.Transition


---@alias UI.Align
---|>'left'     #左对齐
---|'center'    #居中对齐
---|'right'     #右对齐


---@alias UI.Overflow
---|>'show'     #显示
---|'hidden'    #隐藏
---|'ellipsis'  #省略，超出部分使用 ... 显示
---|'shrink'    #缩小



---@class UI.Shadow
---@field color? string
---@field offset? [number, number]

---@class UI.Font
---@field align? UI.Align
---@field bold? boolean
---@field italic? boolean
---@field color? string
---@field size? number
---@field familu? string
---@field line_height? number
---@field shadow? UI.Shadow
---@field vertical_align? UI.Align
---@field overflow? UI.Overflow



---@alias UI.ScrollDirection
--- 水平滚动
---|'horizontal'
--- 竖直滚动
---|'vertical'

---@alias UI.ProgressType
---|'left'              #从右往左
---|'right'             #从左往右
---|'up'                #从下往上
---|'down'              #从上往下
---|'clockwise'         #顺时针
---|'counter_clockwise' #逆时针
---|'bordered left'     #从右往左, 进度部分使用整个九宫图
---|'bordered right'    #从左往右, 进度部分使用整个九宫图
---|'bordered up'       #从下往上, 进度部分使用整个九宫图
---|'bordered down'     #从上往下, 进度部分使用整个九宫图



---@class UI.PanelProp:  UI.BaseProp
---@field array? number
---@field enable_scroll? boolean
---@field scroll_direction? UI.ScrollDirection
---@field scroll_image? string
---@field scroll_color? string
---@field scroll_width? number

---@class UI.ButtonProp: UI.BaseProp
---@field hover_image? string
---@field active_image? string

---@class UI.LabelProp: UI.BaseProp
---@field text? string
---@field font? UI.Font

---@class UI.ProgressProp: UI.BaseProp
---@field progress? number
---@field progress_type? UI.ProgressType

---@class UI.ParticleProp: UI.BaseProp
---@field effect? string
---@field play? boolean
---@field direct_scale? [number,number]
---@field speed? number

---@class UI.SpritesProp: UI.BaseProp
---@field frame_count? number
---@field row_frame_count? number
---@field start_frame? number
---@field end_frame? number
---@field sprite_size? [number,number]
---@field loop? boolean
---@field interval? number
---@field playing? boolean



---@class UI.Template<T>: UI.BaseProp



---创建面板
---@overload fun(prop: UI.PanelProp): UI.Template<'panel'>
---@param name string
---@return fun(prop: UI.PanelProp): UI.Template<'panel'>
function base.ui.panel(name) end

---创建按钮
---@overload fun(prop: UI.ButtonProp): UI.Template<'button'>
---@param name string
---@return fun(prop: UI.ButtonProp): UI.Template<'button'>
function base.ui.button(name) end

---创建文本
---@overload fun(prop: UI.LabelProp): UI.Template<'label'>
---@param name string
---@return fun(prop: UI.LabelProp): UI.Template<'label'>
function base.ui.label(name) end

---创建进度条
---@overload fun(prop: UI.ProgressProp): UI.Template<'progress'>
---@param name string
---@return fun(prop: UI.ProgressProp): UI.Template<'progress'>
function base.ui.progress(name) end

---创建粒子
---@overload fun(prop: UI.ParticleProp): UI.Template<'particle'>
---@param name string
---@return fun(prop: UI.ParticleProp): UI.Template<'particle'>
function base.ui.particle(name) end

---序列帧动画
---@overload fun(prop: UI.SpritesProp): UI.Template<'sprites'>
---@param name string
---@return fun(prop: UI.SpritesProp): UI.Template<'sprites'>
function base.ui.sprites(name) end

---创建控件
---@param template UI.Template<any>
---@param name? string
---@param bind? table
---@param p? base.UI
---@return base.UI
---@return table
---@return boolean
function base.ui.create(template, name, bind, p) end

---创建组件
---@generic T
---@param type_name `T`
---@param base any
---@return T
function base.ui.component(type_name, base) end



---@class base.UI: UI.BaseProp
---@field id string 
---@field type string 
---@field name string 
---@field parent base.UI
---@field show boolean
---@field removed boolean
---@field child base.UI[]
---@field event table
---@field data table
---@field bind table
---@field transition UI.Transition
---@field private _visible boolean
local UI = {}


---添加子控件
---@param child base.UI
---@return boolean 是否成功
function UI:add_child(child) end

---每帧回调
---
---给控件注册回调函数，每帧都会调用这个函数。一个控件可以注册多个回调函数，当控件被移除后回调函数不再运行。你也可以主动调用销毁器来使这个回调函数不再运行。
---
---@param callback fun(dt:number): nil
---@return function 销毁器
function UI:on_tick(callback) end

---移除控件
---@return boolean 是否成功
function UI:remove() end

--- 获取屏幕的rect
---@return number
---@return number
---@return number
---@return number
function UI:get_screen_rect() end

--- 获取UI的rect
---@return number
---@return number
---@return number
---@return number
function UI:get_ui_rect() end


---获取UI图片的原始宽高
---
---
---如果无图片返回0.0, 0.0
---@return number 宽
---@return number 高
function UI:get_image_wh() end

---获取控件的xywh
---@param relative_ctrl_or_option base.UI | string
function UI:xywh(relative_ctrl_or_option) end

---设置控件是否可见
---@param visible boolean
function UI:set_visible(visible) end