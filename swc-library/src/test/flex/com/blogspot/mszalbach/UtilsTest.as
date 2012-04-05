package  com.blogspot.mszalbach {

	import flexunit.framework.Assert;

	public class UtilsTest {

		[Test]
		public function testAddition():void {
		   Assert.assertEquals(12, Utils.addition(7,5));
		}
	}
}
