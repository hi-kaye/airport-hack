class Passenger {
  public string $name;
  public vec<int> $bags = vec[];   
  public function __construct(
    string $name,
    vec<int> $bags) {
    $this->name = $name;
    $this->bags = vec[];
  }

  public function addBag(int $bag): void{
    $this->bags[] = $bag;
  }

  public function getPassenger(): string {
    return $this->name;
  }

  public function getBags(): vec<int> {
    return $this->bags;
  }

}

/* <<__EntryPoint>>
function mains(): void {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();
  $p = new Passenger("kaye", vec[]);
  echo $p->getPassenger();
  $hand_luggage = new Bag(20);
  $hand_luggage_weight = $hand_luggage->getBag();
  $p->addBag($hand_luggage_weight);
  $p->getBags();
} */
