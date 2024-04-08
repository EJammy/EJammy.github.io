---
title: "CS161 Project 2"
date: 2024-03-14T09:56:44-07:00
draft: false
tags: ['go', 'Berkeley', 'project', 'school', 'security', 'design']
categories: []
ShowToc: false
---

I was super into this project and ended up getting full credit! It's 12 am and I can't sleep, so I thought I'll try to reflect on this project a bit, both for myself but also maybe it will help someone. And I may just be trying brag a bit ~~so if any recruiter sees this, please hire me~~.

Basically, 161 is the Berkeley computer security and my favorite class so far. In the [second project](https://fa23.cs161.org/proj2), you build a "secure file storage system." It's probably one of the most open-ended project in Berkeley. After the deadline, the autograder will test your solution for weakness. As such, this is not one of the project where most people get full credit or close to full credit. The distribution looks more like [this](https://assets.cs161.org/proj2/proj2-spec-sp23-distribution.png).

A lot of times I get to around 90% for my projects (you usually have an idea of what you would get in other projects), and just call it a day. I guess because of the challenge in this one and the bragging right potential I ended up spending way more time.

## Designing
Not going to lie, I already had high hopes when starting this project. I mean, just encrypt with AES and share keys with RSA, how hard could that be? Turns out the design was not as easy as I thought.

I don't want to give away too much, but one really big observation that we missed when designing limits how you can find the location of files. Basically, there are two important requirements: 1. users will run multiple copies of the program and 2. append must be constant time. The obvious way to retrieve a file, storing a map of filename to UUID, will most likely break one of the two requirements. We spend a lot of time trying to come up with a solution, but it's actually **right in the skeleton code**. **Read the skeleton code!**

The other hard part in my opinion is sharing. For this I don't really have much to say, other than just try some different ideas.

Overall, it's a good idea to try to seek simple design. I don't want to say it's trivial for this project, but try different ideas before your design gets super complicated.

## Coding
**Helper functions!!**

Break down your design. Some people had 2k lines. We had 700, and our code isn't even that clean. I think structuring code is a very valuable skill from this class. You don't want to spend all the time refactoring, but definitely try a little bit to make it cleaner. To be fair, it's actually not that easy. On one hand you want to have well-defined helper functions instead of fuzzy ones, so you actually know what to do, and it's much easier to collaborate. On the other hand, you might realize there's a case where you want to use a function, but it does something slightly different and your function is not general enough. Personally, I sometimes try *too hard* to design my code to make it more "aesthetic", like remove one edge case, pass one less parameter, keep my code extra DRY. I think at some point it becomes not worth it, especially for short-lived projects like this.

But either way, a subpar structure still helps tremendously compared to no structure / a long block of code.

This also goes back to designing. For example, you can define something simple like functions to interact with the datastore with security and integrity, and suddenly everything is easier. The dream is to have the code read like the design doc.

## Debugging
Note to self: take breaks when coding. Literally wasted like 4 hours because I didn't call `json.Marshal` or something.

Printf debugging is good. Debugger is also pretty good.

## Testing
Ok this is (in my opinion) the fun part. You get to break your design.

I had this really fun idea (something similar is also suggested in the tips from the spec) to bascially:
1. Setup the system to some state
2. Poke at a random byte
3. Run some more functions, which should either yield the correct result, or error

Website TODO: add folding functionality for this chunck of code. Change tab size.

```go
func TestLargeModifyAttack(t *testing.T) {
	// run a bunch of client function

	m := userlib.DatastoreGetMap()
	orig := getDatastoreCopy()

	check := func(t *testing.T) {
		// run a bunch of client function and check that it either errors or is correct
		// ...
	}
	cnt := 0
	for id, bytes := range orig {
		cnt += 1
		for i, val := range bytes {
			doRun := i < 400 && (i%100 == 0 || i%72 == 0)
			doRun = doRun || i < 2
			doRun = doRun || len(bytes)-i < 2
			if doRun {
				userlib.DatastoreClear()
				applyMap(orig)
				m[id][i] = val ^ 0xff
				testStr := "poking byte at " + id.String() + " " + strconv.Itoa(i)
				t.Run(testStr, check)
			}
		}
	}

	for id := range orig {
		for id2 := range orig {
			userlib.DatastoreClear()
			applyMap(orig)
			m[id], m[id2] = m[id2], m[id]
			testStr := "swapping uuid at " + id.String() + "____" + id2.String()
			t.Run(testStr, check)
			m[id], m[id2] = m[id2], m[id]
		}
	}
}
```

I used the go built-in testing framework instead of Ginkgo (the framework we were supposed to use), so my partner had to write some more tests in Ginkgo. And this is actually not that easy. The problem with complicated tests is that I ended up with not so obvious bugs in my test, and I don't know if the bug is in my test or in my code. Would not recommend, unless you do it for fun. Not this way specifically at least, maybe something simpler that does the same thing.

Swapping caught a bunch of key reuse problems. Then I had a pretty genius idea where I changed my `secure_store_to_datastore` function and never had to worry about key reuse ever again.

## A nasty attack
```go
func TestUserAttacks(t *testing.T) {
	// Incorrect password attack:
	// Replaces user in datastore with fake user, then, if user
	// forgets to enter password, they would succesfully log in
	// as the fake user.
	//
	// Fix: [redacted]

	// Generate a fake user
	t.Run("Incorrect password attack", func(t *testing.T) {
		t.Logf("Generating fake user")
		clear()
		client.InitUser("alice", "")
		m := getDatastoreCopy()
		clear()

		t.Logf("Starting normal execution")
		client.InitUser("alice", "realpassword")

		// replace real user with fake user
		applyMap(m)
		for key, val := range m {
			t.Logf("%s, ", key)
			userlib.DatastoreSet(key, val)
		}
		_, err := client.GetUser("alice", "realpassword")
		t.Logf("realpassword; error is %s", err)
		_, err = client.GetUser("alice", "wrongpassword")
		t.Logf("wrongpassword; error is %s", err)
		_, err = client.GetUser("alice", "")
		if err == nil {
			t.Errorf("failed fake password test")
		}
	})
}
```
Honestly, I don't even know if this is valid or tested by the autograder.

## Final thoughts
While the exact setup is not really something that would exist in the real world, it was still a nice project. I spend way more time on it than other projects.

I think an important takeaway from this project is learning to design a whole code base. Projects in other classes, like 186, gives you very good skeleton code. This is great for learning the important algorithms and great ideas without requiring too much work. But being able to build (almost) from scratch is fun and valuable too.

I love Go. It was fun to work in. Not too much crazy stuff going on, but also not annoying to work with.

I wanted to write this up a while ago, but waited half a year after the project. It ended up to be a pretty fun write. I should probably go to bed now though.
