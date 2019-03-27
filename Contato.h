//
//  Contato.h
//  ContatosIP67
//
//  Created by ios8106 on 3/19/19.
//  Copyright © 2019 Caelum. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MKAnnotation.h>

@interface Contato : NSObject <MKAnnotation>
@property (strong) NSString *nome;
@property (strong) NSString *telefone;
@property (strong) NSString *endereco;
@property (strong) NSString *site;
@property (strong) UIImage *foto;
@property (strong) NSNumber *latitude;
@property (strong) NSNumber *longitude;
@end
