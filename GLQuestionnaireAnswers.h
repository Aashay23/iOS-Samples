//
//  GLQuestionnaireAnswers.h
//  Greenlight
//


#import <Foundation/Foundation.h>

@interface GLQuestionnaireAnswers : NSObject

@property (nonatomic, assign) NSInteger s1TypicalFridayNight;
@property (nonatomic, assign) NSInteger s2PeopleYouDontKnowVeryWell;
@property (nonatomic, assign) NSInteger s3MoreFun;
@property (nonatomic, assign) NSInteger s4Sports;
@property (nonatomic, assign) NSInteger s5LookingFor;
@property (nonatomic, assign) NSInteger s6NewThings;
@property (nonatomic, assign) NSInteger s7Age;
@property (nonatomic, assign) NSInteger s8Style;
@property (nonatomic, assign) NSInteger s9Race;
@property (nonatomic, assign) NSInteger s10Rules;
@property (nonatomic, assign) NSInteger s11CompetativeDiscussions;
@property (nonatomic, assign) NSInteger pbq1Wednesday;
@property (nonatomic, assign) NSInteger pbq2MovieGenre;
@property (nonatomic, assign) NSInteger pbq3Cup;
@property (nonatomic, assign) NSInteger pbq4First;
@property (nonatomic, assign) NSInteger pbq5Second;
@property (nonatomic, assign) NSInteger pbq6FavoriteDrinking;



-(id)initWithS1TypicalFridayNight:(NSInteger)s1TypicalFridayNight
s2PeopleYouDontKnowVeryWell:(NSInteger)s2PeopleYouDontKnowVeryWell
           s3MoreFun:(NSInteger)s3MoreFun
            s4Sports:(NSInteger)s4Sports
        s5LookingFor:(NSInteger)s5LookingFor
         s6NewThings:(NSInteger)s6NewThings
               s7Age:(NSInteger)s7Age
             s8Style:(NSInteger)s8Style
              s9Race:(NSInteger)s9Race
            s10Rules:(NSInteger)s10Rules
s11CompetativeDiscussions:(NSInteger)s11CompetativeDiscussions
       pbq1Wednesday:(NSInteger)pbq1Wednesday
      pbq2MovieGenre:(NSInteger)pbq2MovieGenre
             pbq3Cup:(NSInteger)pbq3Cup
           pbq4First:(NSInteger)pbq4First
          pbq5Second:(NSInteger)pbq5Second
pbq6FavoriteDrinking:(NSInteger)pbq6FavoriteDrinking;



@end
