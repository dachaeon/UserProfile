class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @user = User.load
    @user ||= User.new(id: "123", name: "Crockett", email: "me@mac.com", phone: "555-111-1212")

    @user_controller = UserController.alloc.initWithUser(@user)
    @nav_controller = UINavigationController.alloc.initWithRootViewController(@user_controller)
    @window.rootViewController = @nav_controller
    @window.makeKeyAndVisible

    true
  end

  def applicationDidEnterBackground
    @user.save
  end
end
