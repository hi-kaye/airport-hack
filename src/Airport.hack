class Airport {
    public string $name;
    public vec<mixed> $apron;

    public function __construct(
        string $name,
        vec<string> $apron
    ){
        $this->name = $name;
        $this->apron = vec[];
    }

    public function addPlane(mixed $plane): void {
        $this->apron[] = $plane;
    }

    public function getAirportName(): string {
        return $this->name;
    }

//legacy darray dictionary array from php
    /*public function getApron<Tk as arraykey, Tv>():  darray<Tk,Tv> {
        $obj = $this->apron;
        $array = json_decode(json_encode($obj), true); /*convert object to multi-dimesional array*/
        //$single= $array[0]['flight'];
        /*$single_array = (array_reduce($array, 'array_merge', vec[]));
        return $single_array;
    }*/

    public function getApron<Tk as arraykey, Tv>():  darray<Tk,Tv> {
        $obj = $this->apron;
        $array = json_decode(json_encode($obj), true); //convert object to multi-dimesional array
        //$single= $array[0]['flight'];
        return $array;
    }


    public function getInfo<Tk as arraykey, Tv>(): darray<Tk,Tv>{
        $airport_name = $this->name;
        $json = file_get_contents(__DIR__.'/../airports.json');
        $data = json_decode($json); //returns a stdClass object
        $info = vec[];
        foreach ($data as $value) {
            if ($airport_name === $value->iata) {
                $info = $value;
            }
        }
        $array = json_decode(json_encode($info), true); //convert to array from stdClass object
        return $array;
    }
} 

/* <<__EntryPoint>>
function main_(): void {
  require_once(__DIR__.'/../vendor/autoload.hack');
  \Facebook\AutoloadMap\initialize();
    $test = new Airport("LHR", vec[]);
    print_r($test->getInfo());
    $info = $test->getInfo();
    print_r($info["iata"]);
} */