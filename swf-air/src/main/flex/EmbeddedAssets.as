/**
 * User: Xpoint
 * Date: 4/20/12
 * Time: 4:27 AM
 **/
package
{
	public class EmbeddedAssets
	{
		// Image
		[Embed(source='../resources/Baron_Nashor.png')]
		public static var baron:Class;
		[Embed(source='../resources/DragonSquare.png')]
		public static var dragon:Class;
		[Embed(source='../resources/GolemSquare.png')]
		public static var golem:Class;
		[Embed(source='../resources/LizardSquare.png')]
		public static var lizard:Class;

		// Sound
		[Embed(source='../resources/registerSound.mp3')]
		public static var timerSound:Class;

		public function EmbeddedAssets()
		{
		}
	}
}
