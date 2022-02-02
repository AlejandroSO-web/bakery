<?php

namespace App\Controller;

use NotFoundException;
use ProyectoWeb\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\RequestStack;
use App\Cart;
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
        return $this->render('partials/cart.part.html.twig', [
            'controller_name' => 'CartController',
        ]);
    }

    /**
     * @Route("/carro", name="carro")
     */
    public function carro(RequestStack $requestStack)
    {
        $c = new Cart($requestStack);
        $c->addItem(1, 5);
        $c->addItem(5, 10);
        foreach ($c->getCart() as $id => $cantidad){
            echo "$id - $cantidad<br>";
        }
        echo "Cantidad del producto 5: " . $c->getItemCount(5) . "<br>";

        echo "Total productos:" . $c->howMany() . "<br>";
        $c->empty();
        if ( $c->isEmpty())
            echo "vacío<br>";
        else
            echo "lleno<br>";

        
        exit;
    }
    
}