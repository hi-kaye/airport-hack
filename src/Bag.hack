class Bag {
    public function __construct(public int $weight) 
    {} /*  constructor paramter promotion */

    public function getBag(): int {
        return $this->weight;
    }
}

/* <<__EntryPoint>>
function main(): void {
  $b = new Bag(20);
    echo $b->getBag();
} */