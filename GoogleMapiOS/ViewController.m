//
//  ViewController.m
//  GoogleMapiOS
//
//  Created by Aiza Simbra on 12/12/16.
//  Copyright © 2016 Aiza Simbra. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController ()<GMSIndoorDisplayDelegate, GMSMapViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadMap];
}

#pragma mark - Load Map
- (void)loadMap{
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:44.854865
                                                            longitude:-93.242233
                                                                 zoom:18
                                                                    bearing:30
                                                                        viewingAngle:45];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    mapView.delegate = self;
    mapView.indoorDisplay.delegate = self;
    self.view = mapView;
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(44.854865,-93.242233);
    marker.title = @"Mall of America";
    marker.snippet = @"MoA";
    marker.icon = [UIImage imageNamed:@"moa.png"];
    marker.map = mapView;
}

#pragma mark - GMSMapViewDelegate
- (void)mapView:(GMSMapView *)mapView didTapAtCoordinate:(CLLocationCoordinate2D)coordinate{

}

- (void)mapView:(GMSMapView *)mapView didLongPressAtCoordinate:(CLLocationCoordinate2D)coordinate{

}

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker{
    NSLog(@"[GMS] didTapMarker: %@",marker.title);
    return YES;
}

- (void)mapView:(GMSMapView *)mapView didTapPOIWithPlaceID:(NSString *)placeID
                            name:(NSString *)name
                                    location:(CLLocationCoordinate2D)location{
    NSLog(@"[GMS] didTapPOIWithPlaceID: %@ name: %@ location: %f,%f",placeID,name,location.latitude,location.longitude);

}

- (void)mapView:(GMSMapView *)mapView didDragMarker:(GMSMarker *)marker{
    NSLog(@"[GMS] didDragMarker: %@",marker.title);
}

- (void)mapViewDidStartTileRendering:(GMSMapView *)mapView{
    NSLog(@"[GMS] mapViewDidStartTileRendering");
}

- (void)mapViewDidFinishTileRendering:(GMSMapView *)mapView{
    NSLog(@"[GMS] mapViewDidFinishTileRendering");
}

#pragma mark - GMSIndoorDisplayDelegate
- (void)didChangeActiveBuilding:(GMSIndoorBuilding *GMS_NULLABLE_PTR)building{
    NSLog(@"[GMS] didChangeActiveBuilding");
}

- (void)didChangeActiveLevel:(GMSIndoorLevel *GMS_NULLABLE_PTR)level{
    NSLog(@"[GMS] didChangeActiveLevel");
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
