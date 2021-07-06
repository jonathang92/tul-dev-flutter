part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class InitProductEvent extends ProductEvent {
  final List<Product> products;

  InitProductEvent({List<Product> products})
      : products = products ??
            [
              Product(
                id: 1,
                name: "Product 1",
                sku: "TUL DFJ1230",
                description:
                    "Similique quaerat itaque vitae animi expedita eveniet. Non qui amet quia. Quaerat quisquam maxime iusto et porro consequatur.",
              ),
              Product(
                id: 2,
                name: "Product 2",
                sku: "TUL FJT1023",
                description:
                    "Similique quaerat itaque vitae animi expedita eveniet. Non qui amet quia. Quaerat quisquam maxime iusto et porro consequatur.",
              ),
              Product(
                id: 3,
                name: "Product 3",
                sku: "TUL HKY5061",
                description:
                    "Similique quaerat itaque vitae animi expedita eveniet. Non qui amet quia. Quaerat quisquam maxime iusto et porro consequatur.",
              ),
              Product(
                id: 4,
                name: "Product 4",
                sku: "TUL CKF6932",
                description:
                    "Similique quaerat itaque vitae animi expedita eveniet. Non qui amet quia. Quaerat quisquam maxime iusto et porro consequatur.",
              ),
              Product(
                id: 5,
                name: "Product 5",
                sku: "TUL GYLT034",
                description:
                    "Similique quaerat itaque vitae animi expedita eveniet. Non qui amet quia. Quaerat quisquam maxime iusto et porro consequatur.",
              ),
              Product(
                id: 6,
                name: "Product 6",
                sku: "TUL YOT1235",
                description:
                    "Similique quaerat itaque vitae animi expedita eveniet. Non qui amet quia. Quaerat quisquam maxime iusto et porro consequatur.",
              ),
            ];
}
