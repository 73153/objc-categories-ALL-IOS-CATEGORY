//
//  NSData+GroundWork.m
//  Categories
//
//  Created by Wess Cope on 9/21/12.
//  Copyright (c) 2012 GroundWork. All rights reserved.
//

#import "NSData+GroundWork.h"

static char encodingTable[65] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

@implementation NSData (GroundWork)
+ (NSData *) dataFromBase64EncodedString:(NSString *)string
{
    NSData *encodedData = [[NSData alloc] initFromBase64EncodedString:string];
    return encodedData;
}

- (id) initFromBase64EncodedString:(NSString *)string
{
    NSMutableData *mutableData = nil;

    if(string)
    {
        const unsigned char *base64Bytes = nil;

        unsigned long ixtext    = 0,
                      lentext   = 0;
        
        unsigned char ch = 0,
                      inbuf[3],
                      outbuf[4];
        
        short i         = 0,
              ixinbuf   = 0;
        BOOL flignore   = NO,
             flendtext  = NO;
        
        NSData *base64Data = nil;
        
        base64Data  = [string dataUsingEncoding:NSASCIIStringEncoding];
        base64Bytes = [base64Data bytes];
        mutableData = [NSMutableData dataWithCapacity:[base64Data length]];
        lentext     = [base64Data length];

        while(YES)
        {
            if( ixtext >= lentext )
                break;

            ch       = base64Bytes[ixtext++];
            flignore = NO;

            if(( ch >= 'A') && (ch <= 'Z'))
                ch = ch - 'A';
            else if(( ch >= 'a') && (ch <= 'z'))
                ch = ch - 'a' + 26;
            else if((ch >= '0') && (ch <= '9'))
                ch = ch - '0' + 52;
            else if(ch == '+')
                ch = 62;
            else if(ch == '=')
                flendtext = YES;
            else if(ch == '/')
                ch = 63;
            else
                flignore = YES;

            if(!flignore)
            {
                short ctcharsinbuf  = 3;
                BOOL flbreak        = NO;

                if(flendtext)
                {
                    if(!ixinbuf)
                        break;

                    if((ixinbuf == 1) || ( ixinbuf == 2 ) )
                        ctcharsinbuf = 1;
                    else
                        ctcharsinbuf = 2;

                    ixinbuf = 3;
                    flbreak = YES;
                }

                inbuf [ixinbuf++] = ch;

                if(ixinbuf == 4)
                {
                    ixinbuf = 0;
                    outbuf [0] = ( inbuf[0] << 2 ) | ( ( inbuf[1] & 0x30) >> 4 );
                    outbuf [1] = ( ( inbuf[1] & 0x0F ) << 4 ) | ( ( inbuf[2] & 0x3C ) >> 2 );
                    outbuf [2] = ( ( inbuf[2] & 0x03 ) << 6 ) | ( inbuf[2] & 0x3F );
                    
                    for( i = 0; i < ctcharsinbuf; i++ )
                        [mutableData appendBytes:&outbuf[i] length:1];
                }

                if(flbreak)
                    break;
            }
        }
    }

    self = [self initWithData:mutableData];
    return self;
}

- (NSString *) base64EncodeWithLength:(unsigned int)length
{
    const unsigned char	*bytes  = [self bytes];
    NSMutableString *result     = [NSMutableString stringWithCapacity:[self length]];
    
    unsigned long ixtext    = 0,
                  ix        = 0,
                  lentext   = [self length];
    
    long ctremaining = 0;
    
    short i             = 0,
          charsonline   = 0,
          ctcopy        = 0;
    
    unsigned char inbuf[3],
                  outbuf[4];

    while( YES )
    {
        ctremaining = lentext - ixtext;

        if( ctremaining <= 0 )
            break;

        for( i = 0; i < 3; i++ )
        {
            ix = ixtext + i;
            if( ix < lentext )
                inbuf[i] = bytes[ix];
            else
                inbuf [i] = 0;
        }

        outbuf [0] = (inbuf [0] & 0xFC) >> 2;
        outbuf [1] = ((inbuf [0] & 0x03) << 4) | ((inbuf [1] & 0xF0) >> 4);
        outbuf [2] = ((inbuf [1] & 0x0F) << 2) | ((inbuf [2] & 0xC0) >> 6);
        outbuf [3] = inbuf [2] & 0x3F;

        ctcopy = 4;

        switch(ctremaining)
        {
            case 1:
                ctcopy = 2;
                break;
            case 2:
                ctcopy = 3;
                break;
        }

        for( i = 0; i < ctcopy; i++ )
            [result appendFormat:@"%c", encodingTable[outbuf[i]]];

        for( i = ctcopy; i < 4; i++ )
            [result appendFormat:@"%c",'='];

        ixtext      += 3;
        charsonline += 4;

        if( length > 0 )
        {
            if (charsonline >= length)
            {
                charsonline = 0;
                [result appendString:@"\n"];
            }
        }
    }

    return result;
}
@end
