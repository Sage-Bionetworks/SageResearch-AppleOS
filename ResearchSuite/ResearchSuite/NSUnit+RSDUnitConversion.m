//
//  NSUnit+RSDUnitConversion.m
//  ResearchSuite
//
//  Copyright © 2017 Sage Bionetworks. All rights reserved.
//
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//
// 1.  Redistributions of source code must retain the above copyright notice, this
// list of conditions and the following disclaimer.
//
// 2.  Redistributions in binary form must reproduce the above copyright notice,
// this list of conditions and the following disclaimer in the documentation and/or
// other materials provided with the distribution.
//
// 3.  Neither the name of the copyright holder(s) nor the names of any contributors
// may be used to endorse or promote products derived from this software without
// specific prior written permission. No license is granted to the trademarks of
// the copyright holders even if such marks are included in this software.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
// FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
// DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
// OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import "NSUnit+RSDUnitConversion.h"

@implementation NSUnit (RSDUnitConversion)

+ (NSUnit * _Nullable)unitFromSymbol:(NSString *)symbol {
    NSUnit *unit;
    if ((unit = [NSUnitLength unitLengthFromSymbol: symbol])) {
        return unit;
    } else if ((unit = [NSUnitMass unitMassFromSymbol: symbol])) {
        return unit;
    }
    return nil;
}

@end

@implementation NSUnitLength (RSDUnitConversion)

/// Convert the symbol into a unit of length.
+ (NSUnitLength * _Nullable)unitLengthFromSymbol:(NSString *)symbol {
    NSString *searchSymbol = [symbol stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for (NSUnitLength *unit in [self units]) {
        if ([unit.symbol isEqualToString:searchSymbol]) {
            return unit;
        }
    }
    return nil;
}

+ (NSArray <NSUnitLength *> *)units {
    static dispatch_once_t once;
    static NSArray <NSUnitLength *> * units;
    dispatch_once(&once, ^{
        units = @[NSUnitLength.astronomicalUnits,
                  NSUnitLength.centimeters,
                  NSUnitLength.decameters,
                  NSUnitLength.decimeters,
                  NSUnitLength.fathoms,
                  NSUnitLength.feet,
                  NSUnitLength.furlongs,
                  NSUnitLength.hectometers,
                  NSUnitLength.inches,
                  NSUnitLength.kilometers,
                  NSUnitLength.lightyears,
                  NSUnitLength.megameters,
                  NSUnitLength.meters,
                  NSUnitLength.micrometers,
                  NSUnitLength.miles,
                  NSUnitLength.millimeters,
                  NSUnitLength.nanometers,
                  NSUnitLength.nauticalMiles,
                  NSUnitLength.parsecs,
                  NSUnitLength.picometers,
                  NSUnitLength.scandinavianMiles,
                  NSUnitLength.yards
                  ];
    });
    return units;
}

@end

@implementation NSUnitMass (RSDUnitConversion)

/// Convert the symbol into a unit of Mass.
+ (NSUnitMass * _Nullable)unitMassFromSymbol:(NSString *)symbol {
    NSString *searchSymbol = [symbol stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for (NSUnitMass *unit in [self units]) {
        if ([unit.symbol isEqualToString:searchSymbol]) {
            return unit;
        }
    }
    return nil;
}

+ (NSArray <NSUnitMass *> *)units {
    static dispatch_once_t once;
    static NSArray <NSUnitMass *> * units;
    dispatch_once(&once, ^{
        units = @[NSUnitMass.carats,
                  NSUnitMass.centigrams,
                  NSUnitMass.decigrams,
                  NSUnitMass.grams,
                  NSUnitMass.kilograms,
                  NSUnitMass.metricTons,
                  NSUnitMass.micrograms,
                  NSUnitMass.milligrams,
                  NSUnitMass.nanograms,
                  NSUnitMass.ounces,
                  NSUnitMass.ouncesTroy,
                  NSUnitMass.picograms,
                  NSUnitMass.poundsMass,
                  NSUnitMass.shortTons,
                  NSUnitMass.slugs,
                  NSUnitMass.stones
                  ];
    });
    return units;
}

@end
