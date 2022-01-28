<?php

namespace App\Controller;

use App\Entity\Producto;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ProductoController extends AbstractController
{
    /**
     * @Route("/producto", name="producto")
     */
    public function index(): Response
    {
        return $this->render('producto/index.html.twig', [
            'controller_name' => 'ProductoController',
        ]);
    }

    /**
     * @Route("/producto/buscar/{texto}", name="buscar_producto")
     */
    public function buscar(ManagerRegistry $doctrine, $texto): Response{

        $repositorio = $doctrine->getRepository(Producto::class);

        $productos = $repositorio->findAll($texto);

        return $this->render("lista_productos.html.twig",[
                'productos' => $productos
        ]);
    }
}
