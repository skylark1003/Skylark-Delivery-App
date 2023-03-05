# 实验环境

- 虚拟机操作系统：macOS 10.13 High Sierra （64bit） 
- 使用软件：Xcode

# 实现功能

- 设计一个餐厅点菜系统 APP，实现的主要功能页有两个 tab，一个是菜单， 一个是订单。 

- **菜单页**功能包括： 
  - **选择餐厅功能：** 进入系统后，可以选择在哪家餐厅点菜； 
  - **餐厅点菜功能：** 选择某家餐厅后，可以浏览餐厅有哪些菜，每个菜品 栏目有图标，名字； 
  - **菜品详情：** 点击某菜品后，可以查看该菜品详细信息，包括该菜品大 图，单价，名字和详情介绍；在详情页可以将该菜品加入订单；加入订单后，在 订单页 tab 上显示菜品数量。 
- **订单页**功能包括： 
  - 所有选择的菜品的详细列表； 
  - 可以对该列表中的菜品进行删除；
  - 确认后显示一个欢迎页面，表示该用户已经选择好；确认返回主菜单。 取消后返回上一级。
-  所有数据包括餐厅，菜品，订单信息全部存储在 **Sqlite3** 数据库

# 代码说明

- 工程文件夹中包含**初始文件**：
  - AppDelegate.swift、ViewController.swift、Main.storyboard、LaunchScreen.storyboard、Assets.xcassets 和 Info.plist。
  - 其中在 Main.storyboard 中进行主要页面的布局设置；
  - 在 LaunchScreen.storyboard 文件中进行初始化加载动画的设计；
  - 在 Assets.xcassets 中保存使用到的图片资源；
  - 在 ViewController.swift 中编写主界面（登录界面）的控制代码。
-  在**数据库**方面：
  - 创建 SQLiteManager.swift 文件封装针对 sqlite3 数据库的操作，包括打开、关闭数据库，对数据库进行创建、插入、更新、删除和查询操作，以便后续使用 SQL 语句对数据库进行操作。
  - 创建 DatabaseInit.swift 文件，创建餐厅表、菜品表、订单表，并定义后续会用到的增加、减少订单功能。
- 在**个人信息 tab** 方面：
  - 创建 PersonViewController.swift 文件用来显示用户头像和修改保存用户姓名和地址；
  - 创建 AvatarViewController.swift 文件供用户修改头像。 
- 在**餐品选择 tab** 方面：
  - 创建 ResTableViewController.swift 文件来控制餐厅列表界面；
  - 创建 ResTableViewCell.swift 文件对餐厅的自定义cell进行设置。
  - 创建 DishTableViewController.swift 文件来控制各个餐厅餐品的列表界面；
  - 创建 DishTableViewCell.swift 文件对餐品的自定义 cell 进行设置。
  - 创建 DetailViewController.swift 文件来控制餐品详情页的界面。
  - 创建 ShopTableViewController.swift 文件来控制订单列表界面；
  - 创建 ShopTableViewCell.swift 文件对订单的自定义 cell 进行设置。
  - 创建 SubmitViewController.swift 文件来控制订单的提交界面。

# 遗留问题

- 在增加减少餐品的数量时，按钮的点击效果有一些滞后，首次点击没有反应，后面的点击均会滞后一次点击。

- 在订单页面删除订单时，会中断报错，无法进行删除，猜测原因可能是该界面不是一个 UItableview 而是在 view 中新增了一个 tableview，所以可能代码会有区别。

