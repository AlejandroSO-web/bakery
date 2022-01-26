<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class PageController extends AbstractController
{
    /**
     * @Route("/", name="inicio")
     */
    public function index(): Response
    {
        return $this->render('page/index.html.twig', [
            'controller_name' => 'PageController'
        ]);
    }

    /**
     * @Route("/producto", name="productos")
     */
    public function producto(): Response
    {
        return $this->render('page/productos.html.twig', [
            'controller_name' => 'PageController'
        ]);
    }

     /**
     * @Route("/contacto", name="contactos")
     */
    public function contacto(): Response
    {
        return $this->render('page/contacto.html.twig', [
            'controller_name' => 'PageController'
        ]);
    }
}
