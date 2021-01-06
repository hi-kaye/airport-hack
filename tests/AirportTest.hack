use function Facebook\FBExpect\expect;
use type Facebook\HackTest\{DataProvider, HackTest};

final class AirportTest extends HackTest {

    public function testAirportName(): void {
        $lhr = new Airport("LHR", vec[]);
        $airport_name = $lhr->getAirportName();
        expect($airport_name)->toEqual("LHR");
    }

    public function testApron(): void {
        $lcy = new Airport("LCY", vec[]);
        $plane_hkg = new Plane("BA018", "HKG", vec[]);
        $lcy->addPlane($plane_hkg);
        expect($lcy->getApron())->toNotBeEmpty();
    }

    public function testApronArrayFlight(): void {
        $lcy = new Airport("LCY", vec[]);
        $plane_hkg = new Plane("BA018", "HKG", vec[]);
        $lcy->addPlane($plane_hkg);
        $plane_lax = new Plane("BA022", "LAX", vec[]);
        $passenger = new Passenger("Kaye", vec[]);
        $plane_lax->boardPassengers($passenger);
        $lcy->addPlane($plane_lax);
        $apron_array = $lcy->getApron();
        expect($apron_array[0]["flight"])->toEqual("BA018");
    }

       public function testApronArrayDestination(): void {
        $lcy = new Airport("LCY", vec[]);
        $plane_hkg = new Plane("BA018", "HKG", vec[]);
        $lcy->addPlane($plane_hkg);
        $plane_lax = new Plane("BA022", "LAX", vec[]);
        $passenger = new Passenger("Kaye", vec[]);
        $plane_lax->boardPassengers($passenger);
        $lcy->addPlane($plane_lax);
        $apron_array = $lcy->getApron();
        expect($apron_array[1]["destination"])->toEqual("LAX");
    }

        public function testApronArrayPassengers(): void {
        $lcy = new Airport("LCY", vec[]);
        $plane_hkg = new Plane("BA018", "HKG", vec[]);
        $lcy->addPlane($plane_hkg);
        $plane_lax = new Plane("BA022", "LAX", vec[]);
        $passenger = new Passenger("Kaye", vec[]);
        $plane_lax->boardPassengers($passenger);
        $lcy->addPlane($plane_lax);
        $apron_array = $lcy->getApron();
        echo $apron_array[1]["passengers"][0]['name'];
        expect($apron_array[1]["passengers"][0]['name'])->toEqual("Kaye");
    }

    public function testGetInfoCity(): void {
        $lgw = new Airport("LGW", vec[]);
        $info = $lgw->getInfo();
        expect($info["city"])->toEqual("London");
    }

    public function testGetInfoName(): void {
        $lgw = new Airport("LGW", vec[]);
        $info = $lgw->getInfo();
        expect($info["name"])->toEqual("London Gatwick Airport");
    }
}