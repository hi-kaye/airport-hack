use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};

final class PlaneTest extends HackTest {

    public function testFlightNo(): void {
        $plane_hkg = new Plane("BA018", "HKG", vec[]);
        $flight_no = $plane_hkg->getFlight();
        expect($flight_no)->toEqual("BA018");
    }

    public function testDestination(): void {
        $plane_lhr = new Plane("BA019", "LHR", vec[]);
        $dest = $plane_lhr->getDestination();
        expect($dest)->toEqual("LHR");
    }

    public function testPassengers(): void {
        $plane_cdg = new Plane("BA001", "CDG", vec[]);
        $passenger_one = new Passenger("Boris", vec[]);
        $plane_cdg->boardPassengers($passenger_one);
        expect($plane_cdg->getPassengers())->toNotBeEmpty();
    }

    public function testPassengerAndBags(): void {
        $plane_pmi = new Plane("BA011", "PMI", vec[]);
        $passenger_pam = new Passenger("Pam", vec[]);
        $bag_one = new Bag(10);
        $bag_two = new Bag(23);
        $passenger_pam->addBag($bag_one->weight);
        $passenger_pam->addBag($bag_two->weight);
        $plane_pmi->boardPassengers($passenger_pam);
        $passenger_pmi = $plane_pmi->getPassengers();
        expect($passenger_pmi[0]['name'])->toEqual("Pam");
    }

        public function testMultiPassengersAndBags(): void {
        $plane_pmi = new Plane("BA011", "PMI", vec[]);
        $passenger_pam = new Passenger("Pam", vec[]);
        $passenger_sam = new Passenger("Sam", vec[]);
        $bag_one = new Bag(10);
        $bag_two = new Bag(23);
        $passenger_pam->addBag($bag_one->weight);
        $passenger_pam->addBag($bag_two->weight);
        $plane_pmi->boardPassengers($passenger_pam);
        $plane_pmi->boardPassengers($passenger_sam);
        $passenger_pmi = $plane_pmi->getPassengers();
        expect(count($passenger_pmi))->toEqual(2);
    }
}