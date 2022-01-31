<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    /**
     * @Route("/cart", name="cart")
     */
    public function index(): Response
    {
        return $this->render('cart/index.html.twig', [
            'controller_name' => 'CartController',
        ]);
    }
}


<?php

namespace ProyectoWeb\app\controllers;

use Psr\Container\ContainerInterface;

use ProyectoWeb\entity\Product;

use ProyectoWeb\exceptions\QueryException;

use ProyectoWeb\exceptions\NotFoundException;

use ProyectoWeb\database\Connection;

use ProyectoWeb\repository\ProductRepository;

use ProyectoWeb\core\App;

class CartController

{

    protected $container;

   

    // constructor receives container instance

    public function __construct(ContainerInterface $container) {

        $this->container = $container;

    }

    public function render($request, $response, $args) {

        extract($args);

        $title = " Carrito ";

        $withCategories = false;

        return $this->container->renderer->render($response, "cart.view.php", compact('title', 'withCategories'));

    }

}
