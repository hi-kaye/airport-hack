use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};


final class BagTest extends HackTest {

    public function testBag() :void {
        $bag = new Bag(22);
        $bag_weight = $bag->getBag();
        expect($bag_weight)->toEqual(22);
    }
}