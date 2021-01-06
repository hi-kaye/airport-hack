class Plane {
        public string $flight;
        public string $destination;
        public vec<mixed> $passengers;

    public function __construct(
        string $flight,
        string $destination,
        vec<mixed> $passengers) 
    {
        $this->flight = $flight;
        $this->destination = $destination;
        $this->passengers = vec[];
    }

    public function boardPassengers(mixed $passenger): void {
        $this->passengers[] = $passenger;
    }

    public function getDestination(): string {
        return $this->destination;
    }

    public function getFlight(): string {
        return $this->flight;
    }

    public function getPassengers<Tk as arraykey, Tv>():  darray<Tk,Tv> {
        $obj = $this->passengers;
        $array = json_decode(json_encode($obj), true); /*convert object to multi-dimesional array*/
        return $array;
    }

}

/* <<__EntryPoint>>
function main_planes(): void {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();
  $passenger_one = new Passenger("Boris", vec[]);
  $plane = new Plane("BA017", "DPS", vec[]);
  $plane->boardPassengers($passenger_one);
  $bag_one = new Bag(10);
  $passenger_one->addBag($bag_one->weight);
  echo $plane->flight;
  echo $plane->destination;
  print_r($plane->getPassengers());

} */