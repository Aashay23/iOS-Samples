//
//  GLQuestionnaireAnswers.m
//  Greenlight
//


#import "GLQuestionnaireAnswers.h"

@implementation GLQuestionnaireAnswers

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
       pbq6FavoriteDrinking:(NSInteger)pbq6FavoriteDrinking

{
    self = [super init];
    if (self) {
        _s1TypicalFridayNight = s1TypicalFridayNight;
        _s2PeopleYouDontKnowVeryWell = s2PeopleYouDontKnowVeryWell;
        _s3MoreFun = s3MoreFun;
        _s4Sports = s4Sports;
        _s5LookingFor = s5LookingFor;
        _s6NewThings = s6NewThings;
        _s7Age = s7Age;
        _s8Style = s8Style;
        _s9Race = s9Race;
        _s10Rules = s10Rules;
        _s11CompetativeDiscussions = s11CompetativeDiscussions;
        _pbq1Wednesday = pbq1Wednesday;
        _pbq2MovieGenre = pbq2MovieGenre;
        _pbq3Cup = pbq3Cup;
        _pbq4First = pbq4First;
        _pbq5Second = pbq5Second;
        _pbq6FavoriteDrinking = pbq6FavoriteDrinking;
        return self;
    }
    return nil;
}

@end
