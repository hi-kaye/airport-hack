use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};

final class PassengerTest extends HackTest {

    public function testPassenger() :void {
        $pass = new Passenger("Kaye", vec[]);
        $passenger_name = $pass->getPassenger();
        expect($passenger_name)->toBeSame("Kaye");
    }

    public function testHaveBags() :void {
        $pass = new Passenger("Boris", vec[]);
        $hand_luggage = new Bag(20);
        $hand_luggage_weight = $hand_luggage->getBag();
        $pass->addBag($hand_luggage_weight);
        $bags = $pass->getBags();
        expect($bags)->toNotBeEmpty();
    }

    public function testBagWeight() :void {
        $pass = new Passenger("Harvey", vec[]);
        $hand_luggage = new Bag(20);
        $hand_luggage_weight = $hand_luggage->getBag();
        $pass->addBag($hand_luggage_weight);
        $bags = $pass->getBags();
        expect($bags[0])->toEqual(20);

    }
}