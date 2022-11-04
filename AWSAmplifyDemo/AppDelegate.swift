import AWSS3
import AWSMobileClient
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		AWSServiceManager.default().defaultServiceConfiguration = AWSServiceConfiguration(
			region: AWSRegionType.EUCentral1,
			credentialsProvider: AWSMobileClient())

		let awsS3GetPreSignedURLRequest: AWSS3GetPreSignedURLRequest = AWSS3GetPreSignedURLRequest()
		awsS3GetPreSignedURLRequest.httpMethod = AWSHTTPMethod.GET
		awsS3GetPreSignedURLRequest.key = "key"
		awsS3GetPreSignedURLRequest.bucket = "bucketName"
		awsS3GetPreSignedURLRequest.expires = Date(timeIntervalSinceNow: TimeInterval(900))
		AWSS3PreSignedURLBuilder.default().getPreSignedURL(awsS3GetPreSignedURLRequest).continueWith { [self] task in
			// some code...
		}
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration
	{
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>)
	{
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}

}
